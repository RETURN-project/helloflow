# Example of a minimal workflow

## Goals

- [x] Orchestrate a workflow around a parameterized RMarkdown file.
- [x] Run it in a remote server (see [#1](https://github.com/RETURN-project/helloflow/issues/1))
- [ ] Pass a matrix of input names and output files
- [ ] Clean behind

## Install

```sh
make install
```

Requires sudo and [singularity](https://sylabs.io/guides/3.0/user-guide/index.html).

### Installing on a remote server

The singularity definition file can be built locally with:

```sh
make install # Will require sudo credentials
```

and the resulting `.sif` file can be transferred to the remote server. This is entirely equivalent to installing.

## Run

```sh
make run
```
