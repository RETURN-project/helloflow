#!/bin/bash
#SBATCH -N 1      #request 1 node
#SBATCH -c 1      #request 1 core and 8000 MB RAM
#SBATCH -t 5:00   #request 5 minutes jobs slot

# Example of usage:
#
# ./run_dcache.sh -n "Pablo R." -o "output/output.txt"

# Parse parameters
while getopts n:o: flag
do
    case "${flag}" in
        n) NAME=${OPTARG};;
        o) OUTPUTFILE=${OPTARG};;
    esac
done

# Set the directories
TEMPWD="$TMPDIR"/helloflow/"$SLURM_ARRAY_TASK_ID" # Temporary working directory
OUTDIR=$HOME/testground/helloflow/output # Output directory
echo "$TEMPWD"
echo "$OUTDIR"

# Work in temporary directory
mkdir -p "$TEMPWD"
cp -r $HOME/testground/helloflow/* "$TEMPWD"
cd "$TEMPWD"

# ===== Beginning of the analysis script =====

# Execute
singularity run r-rmd.sif \
    Rscript -e "rmarkdown::render('parameterized.Rmd', params = list(who = '${NAME}', outputfile = '${OUTPUTFILE}'))"

# ===== End of analysis script =====

# When done, copy the output to the desired folder in dCache
MACAROON="helloflow_macaroon.conf"
#alias ada="ada --tokenfile ${MACAROON} --api https://dcacheview.grid.surfsara.nl:22880/api/v1"
ada --tokenfile ${MACAROON} --api https://dcacheview.grid.surfsara.nl:22880/api/v1 --whoami
#cp -r "$TEMPWD"/output/* "$OUTDIR"
echo "SUCCESS"
exit 0
