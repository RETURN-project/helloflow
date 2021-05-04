# Parameters
SINGULARITY_DEF="r-rmd.def"
SINGULARITY_SIF="r-rmd.sif"

# Commands
install:
	sudo singularity build ${SINGULARITY_SIF} ${SINGULARITY_DEF}

run:
	./run.sh -n "Pablo R." -o "./output/output.txt"

clean:
	rm parameterized.html
