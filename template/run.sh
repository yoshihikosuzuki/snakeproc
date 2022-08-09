#!/bin/bash

ROOT=$(readlink -f $(dirname $0))

eval "snakemake \
    -s ${ROOT}/workflow/main.smk \
    -d ${ROOT}/workflow/ \
    --profile ${ROOT}/config/ \
    --configfiles ${ROOT}/config/env.yaml ${ROOT}/input.yaml \
    $@"
