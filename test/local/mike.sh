#!/bin/bash
value=$(($(date +%s) % 600 ))

echo "P MikeCheck var1=${value};300;450"
