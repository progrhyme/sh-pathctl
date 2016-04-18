# NAME

**pathctl.bash** - Utility for PATH management

# SYNOPSYS

    #!bash
    source pathctl.bash
    pathctl_show    # show each entry per line
    pathctl_push    /path/to/your-bin
    pathctl_unshift /path/to/your-bin
    pathctl_pop     # removes last entry
    pathctl_shift   # removes first entry

    # remove duplicates in PATH
    pathctl_uniq

    # show verbose messages
    PATHCTL_VERBOSE=1

# DESCRIPTION

Add functions to manage PATH variable.

# AUTHORS

YASUTAKE Kiyoshi <yasutake.kiyoshi@gmail.com>

# LICENSE

The MIT License (MIT)

Copyright (c) 2016 YASUTAKE Kiyoshi
