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

RESULT=$?

if [ $KEEP_ALIVE_AFTER_TEST = "false" ]; then
    echo "Test completed. Exiting..."
    exit $RESULT
else 
    echo "Test completed. Keeping container alive since KEEP_ALIVE_AFTER_TEST is set to true."
    while true; do sleep 1000; done
fi
