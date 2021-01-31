#!/bin/bash

if ps ax |grep -v grep | grep 'postgresql' > /dev/null
then
  echo 'Postgres is already running'
else
  service postgresql start
fi

if ps ax |grep -v grep | grep 'docker' > /dev/null
then
  echo 'Docker is already running'
else
  service docker start
fi
