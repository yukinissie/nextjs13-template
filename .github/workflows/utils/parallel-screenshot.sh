#!/bin/bash
set -vx

PARALLE=2

function run_storybook() {
  npm run storybook:ci >/dev/null 2>&1 &
  echo $!
}

function run_screenshot() {
  for i in `seq 1 $PARALLE`; do
    npx storycap http://localhost:6006 --serverTimeout 600000 --shard ${i}/"$PARALLE" &
  done

  wait
}

function run() {
  storybook_pid=`run_storybook`

  run_screenshot ${i}

  kill -9 ${storybook_pid}

  exit 0
}

function main() {
  run
}

main

exit 0
