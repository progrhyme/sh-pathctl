. ./pathctl.shrc

: "pathctl_unshift_f" && {
  PATH=/usr/local/bin:/usr/bin:/bin
  pathctl_unshift_f /bin
  t_is $PATH /bin:/usr/local/bin:/usr/bin
}

: "pathctl_push_f" && {
  PATH=/usr/local/bin:/usr/bin:/bin
  pathctl_push_f /usr/local/bin
  t_is $PATH /usr/bin:/bin:/usr/local/bin
}

# vim:set ft=sh :
