# NAME

**pathctl.bash** - Utility for PATH management

# SYNOPSYS

    #!bash or zsh
    source pathctl.bash
    pathctl_show    # show each entry per line
    pathctl_push    /path/to/your-bin
    pathctl_unshift /path/to/your-bin
    pathctl_pop     # removes last entry
    pathctl_shift   # removes first entry
    pathctl_push_f    /path/to/your-bin # move to last if exists
    pathctl_unshift_f /path/to/your-bin # move to first if exists

    # remove duplicates in PATH
    pathctl_uniq

    # remove duplicates in PATH
    pathctl_uniq

    # show verbose messages
    PATHCTL_VERBOSE=1

# DESCRIPTION

Add functions to manage PATH variable.

# REQUIREMENTS

Bash or Zsh.

Following function uses associated array which was introduced in Bash v4:

- pathctl\_uniq
- pathctl\_unshift\_f

# AUTHORS

YASUTAKE Kiyoshi <yasutake.kiyoshi@gmail.com>

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi
