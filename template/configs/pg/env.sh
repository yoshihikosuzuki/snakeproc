#!/bin/bash
# NOTE: This script is loaded at the beginnig of each task.

###################################################################################################
# Shell commands that are always executed at the beginning of each job.
# Edit according to your environment.
###################################################################################################

hostname
date
. /etc/bashrc
unset PERL5LIB
source /bio/lmod/lmod/init/bash
module purge
module use /bio/package/.modulefiles
module use /hpgwork2/yoshihiko_s/app/.modulefiles

###################################################################################################
# List of the commands that make dependent commands available.
# Loading moduels of Environment Modules or Lmod is highly recommended.
# Edit the values on the right-hand side according to your environment.
# Do not change the variable names on the left-hand side.
###################################################################################################

_SNAKEMAKE="module load snakemake/7.8.0"
_SEQKIT="module load Other/seqkit/2.0.0"
_SAMTOOLS="module load samtools/1.12"
_BCFTOOLS="module load bcftools/1.9-1"
_BEDTOOLS="module load bedtools/v2.29.2"

###################################################################################################
# Snakemake options including those for cluster execution.
###################################################################################################

PROFILE="deigo"

# Example 1: Local executaiton without job schedulers.
# SMK_OPT=''

# Example 2: HPC execution with a job scheduler.
# NOTE: Specific parameter values for the scheduler are defined in `config/cluster.default.yaml`
#       and `config/cluster.rules.yaml`.
# SMK_OPT='--cluster "qsub -p {cluster.queue} -N {cluster.name} -o {cluster.output} -j y" --jobs 100 --latency-wait 60'

###################################################################################################
# Shell commands that are always executed at the beginning of each job.
###################################################################################################

set -eu
# set -eux
