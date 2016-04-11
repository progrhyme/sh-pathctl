#!bash

# Vars for check and test
__pathctl_changed=""
__pathctl_contains=""

_pathctl_check_contain() {
  local target=$1
  __pathctl_contains=""
  local _path
  for _path in `echo $PATH | tr -s ':' ' '`; do
    if [[ $_path == $target ]]; then
      __pathctl_contains="true"
      break
    fi
  done
}

pathctl_unshift() {
  local path=$1
  __pathctl_changed=""
  _pathctl_check_contain $path
  if [[ -z $__pathctl_contains ]]; then
    PATH=$path:$PATH
    __pathctl_changed="true"
  fi
}

pathctl_push() {
  local path=$1
  __pathctl_changed=""
  _pathctl_check_contain $path
  if [[ -z $__pathctl_contains ]]; then
    PATH=$PATH:$path
    __pathctl_changed="true"
  fi
}

: <<'__EOF__'

=encoding utf8

=head1 NAME

B<pathctl.bash> - Utility for PATH management

=head1 SYNOPSYS

    #!bash
    source pathctl.bash
    pathctl_push    /path/to/your-bin
    pathctl_unshift /path/to/your-bin

=head1 DESCRIPTION

Add functions to manage PATH variable.

=head1 AUTHORS

YASUTAKE Kiyoshi E<lt>yasutake.kiyoshi@gmail.comE<gt>

=cut

__EOF__

