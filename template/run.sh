#!/bin/bash

ROOT=$(readlink -f $(dirname $0))

source ${ROOT}/config/config.env.sh
eval ${_SNAKEMAKE}

# NOTE: need abstraction of cluster settings
eval "snakemake \
    -c 1 \
    -s ${ROOT}/workflow/main.smk \
    -d ${ROOT}/workflow \
    --profile ${ROOT}/config/ \
    $@"

    # --cluster-config ${ROOT}/config/cluster.default.yaml \
    # --cluster-config ${ROOT}/config/cluster.rules.yaml \
    # ${SMK_OPT} \
