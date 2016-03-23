#!/bin/bash
value=$(($(date +%s) % 240 ))

echo "P MikeCheck var1=${value};90;150"
