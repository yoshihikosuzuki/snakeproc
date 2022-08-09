#!/bin/bash
source ../../../config/data.sh
source ../../../config/env.sh

IN_HIFI=${INPUT_HIFI}

ln -sf $(readlink -f ${IN_HIFI}) hifi.fastq
