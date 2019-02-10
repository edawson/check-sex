task checkSex{
    File sampleBAM
    File sampleIndex
    Int diskGB
    String outbase = basename(sampleBAM, ".bam")

    command <<<
        check_sex_samtools.sh ${sampleBAM} > ${outbase}.sex.txt
    >>>

    runtime{
        docker : "erictdawson/check-sex"
        cpu : "1"
        memory : "1 GB"
        disks : "local-disk " + diskGB + " HDD"
    }

    output{
        File sexRatioFile = "${outbase}.sex.txt"
    }
}

workflow checkSexWorkflow{
    File sampleBAM
    File sampleIndex

    Int diskGB = ceil(size(sampleBAM, "GB") + 20)

    call checkSex{
        input:
            sampleBAM=sampleBAM,
            sampleIndex=sampleIndex,
            diskGB=diskGB
        
    }
}
