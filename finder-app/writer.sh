#!/usr/bin/env bash

writefile="${1}"
writestr="${2}"

if [ -z "${writefile}" ] || [ -z "${writestr}" ]; then
    echo "Usage: ${0} <writefile> <writestr>"
    exit 1
fi

if [ -d "${writefile}" ]; then
    echo "Error: file ${writefile} is a directory"
    exit 1
fi

writedir="$(dirname "$writefile")"
if ! mkdir -p "${writedir}"; then
    echo "Error: could not create directory ${writedir}"
    exit 1
fi

if ! echo "${writestr}" > "${writefile}"; then
    echo "Error: file ${writefile} is not writable"
    exit 1
fi
