#!/bin/sh

# YADW: We want to skip one of two identical events from inotifywait.
# Could be a WSL issue
CONSUME_EVENT=true

inotifywait -m -e modify --fromfile sources | while read line
do
  if [ $CONSUME_EVENT = true ]
  then
    make clean
    make all
    CONSUME_EVENT=false
    echo 'Done: make clean all'
  else
    CONSUME_EVENT=true
  fi
done