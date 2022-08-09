shell.executable("bash")
shell.prefix(config["shell_prefix"])

localrules: all
rule all:
    input:
        "done"

localrules: symlink_input
rule symlink_input:
    output:
        hifi = "00-data/hifi/hifi.fastq"
    shell:
        f"""
        cd 00-data/hifi/
        ln -sf $(readlink -f {config["input"]["hifi"]}) hifi.fastq
        # ./symlink_input.sh
        """

rule hifiasm:
    input:
        rules.symlink_input.output.hifi
    output:
        "01-asm/hifiasm/hifiasm.done"
    log:
        "01-asm/hifiasm/hifiasm.log"
    shell:
        f"""
        eval {config["activate"]["hifiasm"]}
        cd 01-asm/hifiasm
        # ./run_hifiasm.sh
        touch hifiasm.done
        """

localrules: finish
rule finish:
    input:
        rules.hifiasm.output
    output:
        "done"
    shell:
        """
        touch {output}
        """
