# Example of a minimal workflow

## Install

```sh
make install
```

Requires sudo and [singularity](https://sylabs.io/guides/3.0/user-guide/index.html).

### Installing on a remote computer

The singularity definition file can be built locally with:

```sh
make install
# Will require sudo credentials
```

and the resulting `.sif` file can be transferred to the remote computer. 

This is entirely equivalent to installing.

## Run

```sh
make run
```
