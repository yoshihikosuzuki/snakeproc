#!/bin/bash

# Commands executed at the beginning of each task
hostname;
date;
. /etc/bashrc;
source /apps/free/lmod/lmod/init/bash;
module purge;
module use --append /apps/.modulefiles72;
module use /apps/.bioinfo-ugrp-modulefiles81;
module use /apps/unit/BioinfoUgrp/DebianMed/10.7/modulefiles;

# Commands to activate the command
_SEQKIT="module load Other/seqkit/2.0.0"
_HIFIASM="module load Other/hifiasm/0.16.1"
_GFATOOLS="module load Other/gfatools/0.5"

# Resources
HIFIASM_THREADS=128
HIFIASM_MEM_GB=100
HIFIASM_TIME_H=48

# Commands executed at the beginning of each task
set -eu;
# set -eux;
