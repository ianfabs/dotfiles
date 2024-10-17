#!/usr/bin/env python3
# vim:fileencoding=utf-8
# License: GPL v3 Copyright: 2017, Kovid Goyal <kovid at kovidgoyal.net>

from sys import argv
from subprocess import run
from typing import List

def main(args: List[str] = argv):
    theme = args[1]
    if not theme:
        theme = input("Theme: ")
    theme = theme.replace(' ', '_')
    command = 'kitty @ set-colors -a /home/ian/.config/kitty/kitty-themes/themes/{}.conf'.format(theme)
    run(command.split(' '))
    pass

