Scripts for checking the sex of WGS samples
-------------------------------------------

### Description
Sometimes it is useful to check the biological sex of a sequenced sample
for QC purposes. This repo has scripts for doing that, as well as
wrappers in WDL. It queries indexes or BAM files (depending on the script used)
to check for the coverage ration between the X and Y chromosomes.

### Output
The output is simply a numeric ratio of the X chromosome coverage (number of reads
divided by sequence length) and the Y chromosome coverage). It looks like this:
```
X / Y ratio : 0.9917
```

A ratio close to one indicates male, which a ratio that deviates from one indicates the
sample is likely female. Ranges I've seen so far for the two sexes are:  
- Male : 0.90 - 1.5  
- Female : 4.5 - 7.0


### Usage
The shell script can be run directly and requires samtools to be globally available on the
system path.
```
    ./check_sex_samtools.sh <sample.bam>
```

There is a docker image containing this setup [on dockerhub](https://hub.docker.com/r/erictdawson/check-sex).  

The WDL script can be run using cromwell after modifying the params.json file:  
```
java -jar cromwell-<version>.jar run -i params.json check-sex-samtools.wdl
```

This workflow is also available in FireCloud at erictdawson/check-sex-samtools.

### Bugs, Requests, Assistance
Please post an issue on [GitHub](https://github.com/edawson/check-sex) for help or to report a bug.
