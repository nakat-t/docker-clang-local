#!/bin/bash

set -eu

for cmd in clang clang-3.9 clang++ clang++-3.9 clang-format clang-format-3.9 clang-tidy clang-tidy-3.9 llvm-ar llvm-ar-3.9
do
  result=0
  output1=$(${cmd} --version 2>&1) || result=$?
  if [ ! "${result}" = "0" ]; then
    echo >&2 "ERROR: command '${cmd}' not found."
    exit ${result}
  fi
  output2=$(echo ${output1} | grep 'version 3.9') || result=$?
  if [ ! "${result}" = "0" ]; then
    echo >&2 "ERROR: wrong version of command '${cmd}'."
    exit ${result}
  fi
done
