# Parameters
SINGULARITY_DEF="r-rmd.def"
SINGULARITY_SIF="r-rmd.sif"

# Commands
install:
	sudo singularity build ${SINGULARITY_SIF} ${SINGULARITY_DEF}

run:
	./run.sh

clean:
	rm output.txt parameterized.html

clean-hard:
	rm output.txt *.html ${SINGULARITY_SIF}