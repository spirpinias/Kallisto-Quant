#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "No arguments supplied"
else
  echo "args:"
  for i in $*; do 
    echo $i 
  done
  echo ""
fi

# Require Files 
sequencing_reads=$(find -L ../data -name "*.fastq.gz" -o -name "*.fq.gz")
gtf_file=$(find -L ../data -name "*.gtf")
index_file=$(find -L ../data -name "*.idx")

# Counting Required Files
sequencing_count=$(echo $sequencing_reads | wc -w)
gtf_count=$(echo $gtf_file | wc -w)
index_count=$(echo $index_file | wc -w)

# Kallisto

if [ -z "${1}" ]; then
  num_thread="--threads=$CO_CPUS"
else
  if [ "${1}" -gt $CO_CPUS ]; then
    echo "Requesting more threads than available. Setting to Max Available."
    num_thread="--threads=$CO_CPUS"
  else
    num_thread="--threads=${1}"
  fi
fi

some_fastq=$(find -L ../data -name "*.f*q*" | head -1)

if [ -z "${2}" ]; then
  pattern_fwd="_$(get_read_pattern "$some_fastq" --fwd)"
else
  pattern_fwd="${2}"
fi

input_fwd_fastqs=$(find -L ../data -name "*$pattern_fwd")
file_count=$(echo $input_fwd_fastqs | wc -w)

if [ -z "${3}" ]; then
  pattern_rev="_$(get_read_pattern "$some_fastq" --rev)"
else
  pattern_rev="${3}"
fi
if [ -z "${4}" ]; then
  len_frag=""
else
  len_frag="-l ${4}"
fi

if [ -z "${5}" ]; then
  std_frag=""
else
  std_frag="-s ${5}"
fi

if [ -z "${6}" ]; then
  num_boot=""
else
  num_boot="-b ${6}"
fi

if [ "${7}" == "True" ]; then
  plain_txt="--plaintext"
else
  plain_txt=""
fi

if [ "${8}" == "True" ]; then
  verbose="--verbose"
else
  verbose=""
fi

if [ "${9}" == "True" ]; then
  single_hang="--single-overhang"
else
  single_hang=""
fi

if [ "${10}" == "True" ]; then
  fr_stranded="--fr-stranded"
else
  fr_stranded=""
fi

if [ "${11}" == "True" ]; then
  rf_stranded="--rf-stranded"
else
  rf_stranded=""
fi

if [ -z "${12}" ]; then
  type_seq="SingleEnded"
else
  type_seq=${12}
fi