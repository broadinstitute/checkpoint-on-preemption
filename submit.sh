#!/bin/bash

gsutil cp scripts/cromwell_checkpointing_script.sh gs://broad-dsde-methods-checkpoint/

cromshell submit wdl/CheckpointDemo.wdl input/CheckpointDemo.test.json resources/fresh.run.json
