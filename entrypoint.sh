#!/bin/bash
# This script will be executed when the container starts
# It will run a benchmark test on the specified host

echo "Testing on host $WARP_HOST"
echo "Access key: $WARP_ACCESS_KEY"

if [[ -z "$WARP_HOST" || -z "$WARP_ACCESS_KEY" || -z "$BENCH_MODE" || -z "$DURATION" ]]; then
    echo "One or more required variables are missing."
    exit 1
fi

echo "Running benchmark test..."
warp ${BENCH_MODE} --duration=${DURATION} $EXTRA_ARGS

exit 0
