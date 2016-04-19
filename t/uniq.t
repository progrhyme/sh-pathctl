. ./pathctl.bash

: "pathctl_uniq" && {
  : "pathctl_uniq makes no change if PATH is already unique" && {
    PATH=/usr/local/bin:/usr/bin:/bin
    pathctl_uniq
    t_is $PATH "/usr/local/bin:/usr/bin:/bin"
  }
  : "pathctl_uniq remove duplicates of PATH" && {
    PATH=/usr/local/bin:/usr/bin:/bin:/bin:a:a:b:b:b
    pathctl_uniq
    t_is $PATH "/usr/local/bin:/usr/bin:/bin:a:b"
  }
}

# vim:set ft=sh :
