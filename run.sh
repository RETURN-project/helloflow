#!/bin/sh

# Example of usage:
#
# ./run.sh -n "Pablo R." -o "output/output.txt"

# Parse parameters
while getopts n:o: flag
do
    case "${flag}" in
        n) NAME=${OPTARG};;
        o) OUTPUTFILE=${OPTARG};;
    esac
done

# Execute
singularity run r-rmd.sif \
    Rscript -e "rmarkdown::render('parameterized.Rmd', params = list(who = '${NAME}', outputfile = '${OUTPUTFILE}'))"
