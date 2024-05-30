#!/bin/bash

CONCURRENT=32

for i in 1k 90k 1m 10m 100m; do
  echo "------------------------------------------------------------"
  OBJECT_SIZE=$i
  echo "Running test with ${CONCURRENT} concurrent connections and ${OBJECT_SIZE} object size"
  warp ${BENCH_MODE} --duration=${DURATION} $EXTRA_ARGS --bucket=${WARP_BUCKET}
done

if [ $KEEP_ALIVE_AFTER_TEST = "false" ]; then
    echo "Test completed. Exiting..."
    exit $RESULT
else 
    echo "Test completed. Keeping container alive since KEEP_ALIVE_AFTER_TEST is set to true."
    while true; do sleep 1000; done
fi