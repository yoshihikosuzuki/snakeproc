# snakeproc

Procedural Snakemake - An experimental template usage of snakemake for more intuitive workflows

## Aim and Rationale

Snakemake defines the a workflow in the same manner as Makefile. It has great features:

- Separation between each task and the entire flow of the pipeline (i.e. dependency between tasks)
- Separation bewteen the main commands and the configuration (e.g. job manager, prefix commands, temp file removal) of each task

However, Snakemake can be sometimes counter-intuitive (at least for me):

- The typical shell script-based workflow is procedural; i.e. we run commands one by one according to our needs, which is reversed against the Makefile-styled dependency declaration of Snakemake.
- The name of each output file must be unique, which requires a careful consideration about the directory structure of the workflow.
- The main commands of a task are embedded in a Snakefile, which makes the user inaccesible to the commands as a shell script.

## Changes made

- Constraints on the directory structure and the output (dummy) files, so that we can define the entire pipeline in a procedural manner.
- Separation between the main commands (as a shell script) and the other parameters of each task.

## Detail

### Directory structure

```
workplace/
  Snakefile
  config/
    env.toml
    wf.toml
  scripts/
    01-X/
      run_X.sh
    02-Y/
      run_Y.sh
    03-Z/
      run_Z.sh
```

### Snakefile

```
rule 01-X:
  input:
    X-input
  output:
    01-X/X.done
  resources:
    ...
  shell:
    """
    script/01-X/run_X.sh
    """
```
