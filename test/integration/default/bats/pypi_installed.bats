#!/usr/bin/env bats

run source /opt/test/venv/bin/activate

@test "pypi-server exist" {
  run which pypi-server --version
  [ "$status" -eq 0 ]
}
