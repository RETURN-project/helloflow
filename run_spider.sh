#!/bin/sh
# Set parameters
NAME="Pablo R."

# Execute
srun \
    singularity run r-rmd.sif \
    Rscript -e "rmarkdown::render('parameterized.Rmd', params = list(who = '${NAME}'))"