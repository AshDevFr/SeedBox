#!/bin/bash

DIR=$1

PRE=$2

cd "$DIR"
for file in *
do
  ln -fs "$DIR/$file" "$DIR/${PRE}${file}"
done
