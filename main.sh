#!/bin/bash

# Usage:
# SLURM_ARRAY_TASK_ID=2 ./main.sh inputs.csv 
# or
# sbatch --array=2-3 -N1 ./main.sh

# Old idea:
# cat $1 | xargs -n 1 ./run.sh

# Parse variables from line in csv file
line=`sed "${SLURM_ARRAY_TASK_ID}q;d" $1`
IFS=, read name output <<< "$line"

# Check parsed information
echo "$line"
echo "$name"
echo "$output"

# Build and run the desired command
./run.sh -n "$name" -o "$output"