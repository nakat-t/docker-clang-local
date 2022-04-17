#!/bin/bash

set -eu

version=12

for cmd in clang clang-${version} clang++ clang++-${version} clang-format clang-format-${version} clang-tidy clang-tidy-${version} llvm-ar llvm-ar-${version}
do
  result=0
  output1=$(${cmd} --version 2>&1) || result=$?
  if [ ! "${result}" = "0" ]; then
    echo >&2 "ERROR: command '${cmd}' not found."
    exit ${result}
  fi
  output2=$(echo ${output1} | grep "version ${version}") || result=$?
  if [ ! "${result}" = "0" ]; then
    echo >&2 "ERROR: wrong version of command '${cmd}'."
    exit ${result}
  fi
done
