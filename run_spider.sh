#!/bin/bash
#SBATCH -N 1      #request 1 node
#SBATCH -c 1      #request 1 core and 8000 MB RAM
#SBATCH -t 5:00   #request 5 minutes jobs slot

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

# Create temporary directory
mkdir "$TMPDIR"/helloflow
cp -r $HOME/testground/helloflow/* "$TMPDIR"/helloflow
cd "$TMPDIR"/helloflow

# ===== Beginning of the analysis script =====

# Execute
srun \
    singularity run r-rmd.sif \
    Rscript -e "rmarkdown::render('parameterized.Rmd', params = list(who = '${NAME}', outputfile = '${OUTPUTFILE}'))"

# ===== End of analysis script =====

# When done, copy the output to your /home storage
cp -r "$TMPDIR"/helloflow/output/* $HOME/testground/helloflow/output
echo "SUCCESS"
exit 0
