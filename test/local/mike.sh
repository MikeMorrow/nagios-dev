#!/bin/bash
checkLocation=$(dirname $(readlink -f $0))
echo
if [ -e ${checkLocation}/flap ]; then
  value=$(($(date +%s) % 600 ))
else
  value=$(($(date +%s) % 250 ))
fi
echo "P MikeCheck var1=${value};300;450"
