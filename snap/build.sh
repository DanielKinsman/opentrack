#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd $DIR
docker build . --tag opentrack_ci:latest
docker run -v $DIR:/mnt/opentrack opentrack_ci:latest
