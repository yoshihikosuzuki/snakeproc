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
        mkdir -p 00-data/hifi/
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
    threads: config["hifiasm"]["threads"]
    resources:
        mem_gb = config["hifiasm"]["mem_gb"],
        time_h = config["hifiasm"]["time_h"]
    shell:
        f"""
        mkdir -p 01-asm/hifiasm
        cd 01-asm/hifiasm

        eval {config["activate"]["hifiasm"]}
        eval {config["activate"]["gfatools"]}
        eval {config["activate"]["seqkit"]}

        hifiasm -o hifi -t {{threads}} ../../{{input}}
        for DATA in *tg.gfa; do
            gfatools gfa2fa ${{{{DATA}}}} >${{{{DATA%.gfa}}}}.fasta
        done

        touch ../../{{output}}
        """

localrules: finish
rule finish:
    input:
        rules.hifiasm.output
    output:
        "done"
    shell:
        f"""
        touch {{output}}
        """
