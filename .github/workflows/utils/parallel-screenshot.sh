#!/bin/bash
set -vx

PARALLE=1

function run_storybook() {
  npm run storybook:ci >/dev/null 2>&1 &
  # trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
}

function run_screenshot() {
  i=$1
  npx storycap http://localhost:6006 --serverTimeout 600000 --shard ${i}/"$PARALLE" &
  echo $!
}

function wait_screenshot() {
  pid=$1
  wait $pid
}

function run() {
  run_storybook

  for i in `seq 1 $PARALLE`; do
    pid=$(run_screenshot ${i})
    # wait_screenshot $pid
  done
}

function main() {
  run
}

main

exit 0
