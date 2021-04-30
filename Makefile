# Parameters
SINGULARITY_DEF="r-rmd.def"
SINGULARITY_SIF="r-rmd.sif"
OUTPUTFILE="output.txt"

# Commands
install:
	sudo singularity build ${SINGULARITY_SIF} ${SINGULARITY_DEF}

run:
	./run.sh

clean:
	rm ${OUTPUTFILE} parameterized.html

clean-hard:
	rm ${SINGULARITY_SIF} ${OUTPUTFILE} parameterized.html