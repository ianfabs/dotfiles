#!/usr/bin/env python3
# vim:fileencoding=utf-8
# License: GPL v3 Copyright: 2017, Kovid Goyal <kovid at kovidgoyal.net>

import sys
import subprocess
from typing import List

def main(args: List[str] = sys.argv):
    theme = args[1]
    if not theme:
        theme = input("Theme: ")
    theme = theme.replace(' ', '_')
    command = 'ln -sf /home/ian/.config/kitty/kitty-themes/themes/{}.conf /home/ian/.config/kitty/theme.conf'.format(theme)
    subprocess.run(command.split(' '))
    pass

