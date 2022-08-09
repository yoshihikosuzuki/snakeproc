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

1. Copy the template to your work place.
2. Move to `config/` and edit `cluster_global.yaml` according to your environment and `config.yaml` and `cluster_wf.yaml` according to your data.
3. Edit cluster settings in `run.sh` according to your environment.
4. Run `run.sh`.

```
config/
|-- cluster.default.yaml : Default cluster job scheduling configuration
|-- cluster.wf.yaml      : Rule-specific cluster job schefuling configuration
|-- config.data.sh       : Input data-specific configuration
`-- config.env.sh        : Environment-specific configuration
```

## Useful links for information about Snakemake

- [Command line options](https://snakemake.readthedocs.io/en/stable/executing/cli.html)
