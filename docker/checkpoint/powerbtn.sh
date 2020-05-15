#!/bin/sh

# Shutdown handler

echo 'Shutting down... here's a list of files in /cromwell_root'
find /cromwell_root -exec ls -lah {} \; > /cromwell_root/powerbtn_files.txt

gsutil cp /cromwell_root/powerbtn_files.txt gs://broad-dsde-methods-checkpoint/
