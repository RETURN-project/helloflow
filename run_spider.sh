#!/bin/bash
#SBATCH -N 1      #request 1 node
#SBATCH -c 1      #request 1 core and 8000 MB RAM
#SBATCH -t 5:00   #request 5 minutes jobs slot

# Create temporary directory
mkdir "$TMPDIR"/helloflow
cp -r $HOME/testground/helloflow/* "$TMPDIR"/helloflow
cd "$TMPDIR"/helloflow

# ===== Beginning of the analysis script =====

# Set parameters
NAME="Pablo R."
OUTPUTFILE="output/output.txt"

# Execute
srun \
    singularity run r-rmd.sif \
    Rscript -e "rmarkdown::render('parameterized.Rmd', params = list(who = '${NAME}', outputfile = '${OUTPUTFILE}'))"

# ===== End of analysis script =====

# When done, copy the output to your /home storage
cp -r "$TMPDIR"/helloflow/output/* $HOME/testground/helloflow/output
echo "SUCCESS"
exit 0
