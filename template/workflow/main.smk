################################################################################
#                                   Configs
################################################################################

# configfile: "config/config.yaml"
shell.executable("bash")

import os
ROOT = os.path.normpath(os.path.dirname(workflow.snakefile))

################################################################################
#                                    Rules
################################################################################

localrules: all
rule all:
    input: f"{ROOT}/done"

localrules: symlink_input
rule symlink_input:
    output:
        hifi = f"{ROOT}/00-data/hifi/hifi.fastq"
    threads: 1
    shell:
        f"""
        cd {ROOT}/00-data/hifi/
        ./symlink_input.sh
        """

rule hifiasm:
    input:
        rules.symlink_input.output.hifi
    output:
        f"{ROOT}/done"
    shell:
        f"""
        cd {ROOT}/01-asm/hifiasm
        # ./run_hifiasm.sh
        touch {{output}}
        """
