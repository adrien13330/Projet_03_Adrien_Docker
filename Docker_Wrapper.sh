#!/bin/bash

# First process : nginx
nginx
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start nginx: $status"
  exit $status
fi

# Second process : ssh
ssh
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start ssh: $status"
  exit $status
fi
