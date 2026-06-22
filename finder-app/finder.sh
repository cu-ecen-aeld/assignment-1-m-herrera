#!/usr/bin/env bash

filesdir="${1}"
searchstr="${2}"

if [ -z "${filesdir}" ] || [ -z "${searchstr}" ]; then
    echo "Usage: ${0} <filesdir> <searchstr>"
    exit 1
fi

if [ ! -d "${filesdir}" ]; then
    echo "Error: ${filesdir} is not a directory"
    exit 1
fi

file_count=0
line_matches=0

count_files() {
    for file in "$1"/*; do
        if [ -d "${file}" ]; then
            count_files "${file}"
        elif [ -f "${file}" ]; then
            ((file_count += 1))
            ((line_matches += $(grep "${searchstr}" "${file}" | wc --lines)))
        fi
    done
    return 0
}

count_files "${filesdir}"
echo "The number of files are ${file_count} and the number of matching lines are ${line_matches}"
