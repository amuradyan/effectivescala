#!/bin/sh

inotifywait -m -e modify --fromfile sources | while read line
do
    make clean
    make all
done