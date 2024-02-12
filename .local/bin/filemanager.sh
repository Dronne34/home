#!/bin/bash

OUT=$(sed -e 's/\/{3}/\/{4}/g' $1)
st -n "Ranger File Manager" -e ranger $OUT
