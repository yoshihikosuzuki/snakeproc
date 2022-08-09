#!/bin/bash

ROOT=$(readlink -f $(dirname $0))

source ${ROOT}/config/env.sh
eval ${_SNAKEMAKE}

eval "snakemake \
    -c 1 \
    -s ${ROOT}/workflow/main.smk \
    -d ${ROOT}/workflow/ \
    --profile ${ROOT}/config/ \
    $@"

    # --cluster-config ${ROOT}/config/cluster.rules.yaml \
