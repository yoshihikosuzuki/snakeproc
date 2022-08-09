#!/bin/bash
# Environment-specific settings for the workflow.

###################################################################################################
# Shell commands that are always executed at the beginning of each job.
# Edit according to your environment.
###################################################################################################

hostname
date
. /etc/bashrc
source /apps/free/lmod/lmod/init/bash
module purge
module use --append /apps/.modulefiles72
module use /apps/.bioinfo-ugrp-modulefiles81
module use /apps/unit/BioinfoUgrp/DebianMed/10.7/modulefiles

###################################################################################################
# List of the commands that make dependent commands available.
# Loading moduels of Environment Modules or Lmod is highly recommended.
# Edit the values on the right-hand side according to your environment.
# Do not change the variable names on the left-hand side.
###################################################################################################

_SNAKEMAKE="module load snakemake/6.12.3"
_SEQKIT="module load Other/seqkit/2.0.0"
_SAMTOOLS="module load samtools/1.12"
_BCFTOOLS="module load bcftools/1.9-1"
_BEDTOOLS="module load bedtools/v2.29.2"

###################################################################################################
# Shell commands that are always executed at the beginning of each job.
###################################################################################################

set -eu
# set -eux
