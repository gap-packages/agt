#!/bin/sh

GAP_EXE=$GAP_DIR
if [ "x$GAP_DIR" = "x" ]; then
  GAP_DIR=$(cd "/usr/share/gap-4.9.3/pkg/agt/lib/../../.." && pwd)
  GAP_EXE=/usr/share/gap-4.9.3/pkg/agt/lib
fi

exec "$GAP_EXE/gap" -l "$GAP_DIR" "$@"
