# Example of a minimal workflow

This project generates a personalized `Hello world!` message using a parameterized RMarkdown file.

## Goals

- [x] Orchestrate a workflow around a parameterized RMarkdown file.
- [x] Run it in a remote server (see [#1](https://github.com/RETURN-project/helloflow/issues/1)).
- [x] Pass a matrix of input names and output files.
- [x] Transfer to `dCache`.
- [x] Clean behind.

## Install

```sh
make install
```

Requires sudo and [singularity](https://sylabs.io/guides/3.0/user-guide/index.html).

Copying to `dCache` requires creating a macaroon. For obvious security reasons, this is not included.

### Installing on a remote server

The singularity definition file can be built locally with:

```sh
make install # Will require sudo credentials
```

and the resulting `.sif` file can be transferred to the remote server. This is entirely equivalent to installing.

## Run

### Locally

Using `make`:

```sh
make run
```

or, equivalently:

```sh
./run.sh -n "Pablo R." -o "./output/output.txt"
```

### Batch job on slurm

#### Step 1: set your inputs on a `csv`

```csv
Name,Output
Pablo,output/pablo.txt
Wanda,output/wanda.txt

```

Do not forget to finish the `csv` with a new line.

#### Step 2: run

```sh
sbatch --array=2-3 -N1 ./main.sh inputs.csv 
# Notice that we skip line 1 from the csv
```