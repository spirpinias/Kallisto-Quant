#!/bin/bash 

set -ex

source ./config.sh
source ./utils.sh

if [ $gtf_count -eq 1 ];
then

    echo "Annotation was Found"
    echo "Annotation File : ${gtf_file}"

    if [ $index_count -eq 1 ];
    then

        echo "Index was Found"
        echo "Index File : ${index_file}"

        if [ $sequencing_count -gt 0 ];
        then
            
            echo "Sequencing Reads Found"
            echo "Sequencing Reads : ${sequencing_reads}"


            for input_fwd_fastq in $input_fwd_fastqs
            do
            
                file_prefix=$(sed "s/$pattern_fwd//" <<< $input_fwd_fastq)
                file_prefix=$(basename $file_prefix)
                input_rev_fastq=$(get_reverse_file "$input_fwd_fastq")

                if [ -z $input_rev_fastq ]; then

                    echo "Running in single end mode"
                    read_files="$input_fwd_fastq"
                    flag_single="--single"
                    read_distr="${len_frag} ${std_frag}"
                else
                
                    echo "Running in paired end mode."
                    read_files="$input_fwd_fastq $input_rev_fastq"
                    flag_single=""
                    read_distr=""
                fi

                kallisto quant \
                ${plain_txt} \
                ${verbose} \
                ${single_hang} \
                ${fr_stranded} \
                ${rf_stranded} \
                -i ${index_file} \
                -o ../results/ \
                ${num_boot} \
                --gtf ${gtf_file} \
                ${flag_single} \
                ${read_distr} \
                ${num_thread} \
                ${read_files}

            done
        else
            echo "You need one or two sequencing reads for single and paired end, respectively."
            exit 1
        fi
    else
        echo "You need 1 index file in .idx format. Please see Kallisto Index."
        exit 1
    fi
else
    echo "You need 1 annotation file in .gtf format."
    exit 1
fi