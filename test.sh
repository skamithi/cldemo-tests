#!/bin/bash

# Should we ignore linter failures?
IGNORE_FAILURES=0
# Did all of the linters pass?
RET_SUCCESS=0

while getopts ":i" OPT; do
  case $OPT in
    i)
      IGNORE_FAILURES=1
      ;;
    \?)
      echo "Unknown option: -$OPTARG" >&2
      ;;
  esac
done

# Check and install dependencies
for GEM in ruby-lint; do
  gem list | grep $GEM 2>&1 >/dev/null 
  if [ $? -ne 0 ]; then
    gem install $GEM
  fi
done

# Lint the Serverspec file
printf "***\nChecking Serverspec...\n***\n"
for SPEC in $(find spec -name *_spec.rb)
do
  echo "Checking $SPEC"
  # Settings come from ruby-lint.yml
  ruby-lint $SPEC
  if [ $? -ne 0 ]; then
    RET_SUCCESS=1
  fi
done

if [ $RET_SUCCESS -ne 0 ]; then
  printf "***\nSERVERSPEC CHECKS FAILED\n***\n"
fi

# If the caller is ignoring failures, make sure we always return successfully
if [[ $IGNORE_FAILURES -eq 1 && $RET_SUCCESS -ne 0 ]]; then
  printf "***\nIgnoring failures\n***\n"
  RET_SUCCESS=0
fi

exit $RET_SUCCESS
