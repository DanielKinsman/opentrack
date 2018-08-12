#!/bin/bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
DIR="$SCRIPT_DIR/../"

docker build -f "$SCRIPT_DIR/Dockerfile" "$DIR" --tag opentrack_ci:latest
docker run -v $DIR:/mnt/opentrack opentrack_ci:latest
