#!/usr/bin/env bats

@test "pip installed" {
  run which pip
  [ "$status" -eq 0 ]
}
