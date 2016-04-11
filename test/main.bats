#!/usr/bin/env bats

load test_helper

: "pathctl_push" && {
  @test "pathctl_push unless PATH contains target" {
    target=/no/such/path
    _pathctl_check_contain $target
    [ -z "$__pathctl_contains"  ]
    pathctl_push $target
    _pathctl_check_contain $target
    [ "$__pathctl_contains"  ]
    [ "$__pathctl_changed"  ]
  }

  @test "pathctl_push doesn't push twice or more" {
    target=/no/such/path
    _pathctl_check_contain $target
    [ -z "$__pathctl_contains"  ]
    pathctl_push $target
    _pathctl_check_contain $target
    [ "$__pathctl_contains"  ]
    [ "$__pathctl_changed"  ]
    pathctl_push $target
    [ -z "$__pathctl_changed"  ]
  }

  @test "pathctl_push does nothing if PATH contains target" {
    echo $PATH
    target=/sbin
    pathctl_push $target
    [ -z "$__pathctl_changed"  ]
  }
}

: "pathctl_unshift" && {
  @test "pathctl_unshift unless PATH contains target" {
    target=/no/such/path
    _pathctl_check_contain $target
    [ -z "$__pathctl_contains"  ]
    pathctl_unshift $target
    _pathctl_check_contain $target
    [ "$__pathctl_contains"  ]
    [ "$__pathctl_changed"  ]
  }

  @test "pathctl_unshift doesn't unshift twice or more" {
    target=/no/such/path
    _pathctl_check_contain $target
    [ -z "$__pathctl_contains"  ]
    pathctl_unshift $target
    _pathctl_check_contain $target
    [ "$__pathctl_contains"  ]
    [ "$__pathctl_changed"  ]
    pathctl_unshift $target
    [ -z "$__pathctl_changed"  ]
  }

  @test "pathctl_unshift does nothing if PATH contains target" {
    echo $PATH
    target=/sbin
    pathctl_unshift $target
    [ -z "$__pathctl_changed"  ]
  }
}

