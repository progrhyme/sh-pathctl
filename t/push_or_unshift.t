. ./pathctl.shrc

: "pathctl_push" && {
  : "pathctl_push unless PATH contains target" && {
    target=/no/such/path
    _pathctl_check_contain $target
    t_ng "$__pathctl_contains" "doesn't contain $target"
    pathctl_push $target
    _pathctl_check_contain $target
    t_ok "$__pathctl_contains"
    t_ok "$__pathctl_changed"
  }

  : "pathctl_push doesn't push twice or more" && {
    target=/no/such/path2
    _pathctl_check_contain $target
    t_ng "$__pathctl_contains" "doesn't contain $target"
    pathctl_push $target
    _pathctl_check_contain $target
    t_ok "$__pathctl_contains"
    t_ok "$__pathctl_changed"
    pathctl_push $target
    t_ng "$__pathctl_changed"
  }

  : "pathctl_push does nothing if PATH contains target" && {
    target=/sbin
    pathctl_push $target
    t_ng "$__pathctl_changed"
  }
}

: "pathctl_unshift" && {
  : "pathctl_unshift unless PATH contains target" && {
    target=/no/such/path3
    _pathctl_check_contain $target
    t_ng "$__pathctl_contains"
    pathctl_unshift $target
    _pathctl_check_contain $target
    t_ok "$__pathctl_contains"
    t_ok "$__pathctl_changed"
  }

  : "pathctl_unshift doesn't unshift twice or more" && {
    target=/no/such/path4
    _pathctl_check_contain $target
    t_ng "$__pathctl_contains"
    pathctl_unshift $target
    _pathctl_check_contain $target
    t_ok "$__pathctl_contains"
    t_ok "$__pathctl_changed"
    pathctl_unshift $target
    t_ng "$__pathctl_changed"
  }

  : "pathctl_unshift does nothing if PATH contains target" && {
    target=/sbin
    pathctl_unshift $target
    t_ng "$__pathctl_changed"
  }
}
# vim:set ft=sh :
