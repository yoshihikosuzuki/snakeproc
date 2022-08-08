#!/bin/bash
source ../../../config/config.data.sh
source ../../../config/config.env.sh

IN_HIFI=${INPUT_HIFI}

ln -sf $(readlink -f ${IN_HIFI}) hifi.fastq
