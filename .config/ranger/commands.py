import os
import shutil
import subprocess
from typing import List, Optional, Union

from ranger.api.commands import Command


class mkcd(Command):
    """
    Create a directory and 'cd' into it
    Based on the 'cd' command:
    https://github.com/ranger/ranger/blob/42cb5a521bf9b24eaaf47daed2b45763e704c347/ranger/config/commands.py#L903-L917
    """

    def execute(self):
        dirname = os.path.join(self.fm.thisdir.path, os.path.expanduser(self.rest(1)))
        if not os.path.lexists(dirname):
            os.makedirs(dirname)
            self.fm.cd(dirname)
        else:
            self.fm.notify("file/directory exists!", bad=True)


class fzf_select(Command):
    """
    Find a file using fzf. Use fd instead of find.
    """

    fd_command = "fd -L"
    multi_select = False
    preview = True
    hidden = False

    @property
    def command(self):
        """Command to run to run the find/fzf command"""
        return (
            f"{os.environ.get('RANGER_FZF_COMMAND', self.__class__.fd_command)} "
            f"| fzf {'-m' if self.__class__.multi_select else '+m'} --border --margin=1 "
            f"--padding=0 --preview='bat --style=numbers --color=always {'{}'}' "
            f"--border-label='{'Normal' if not self.hidden else 'Hidden'} Search'"
        )

    # helper function to run fzf in with self.command
    # returns file if selected else none
    def run_fzf(self) -> Optional[Union[List[str], str]]:
        fzf = self.fm.execute_command(self.command, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            stdout_decoded = stdout.decode("utf-8").strip()
            if self.__class__.multi_select:
                return list(
                    map(
                        lambda s: os.path.abspath(s).strip(),
                        stdout_decoded.splitlines(),
                    )
                )
            else:
                return os.path.abspath(stdout_decoded)
        else:
            return None

    def execute(self):
        fzf_file = self.run_fzf()
        if fzf_file is None:
            return
        assert isinstance(fzf_file, str)
        if os.path.isdir(fzf_file):
            self.fm.cd(fzf_file)
        else:
            self.fm.select_file(fzf_file)


class fzf_select_hidden(fzf_select):
    fd_command = "fd -H -L"
    hidden = True
