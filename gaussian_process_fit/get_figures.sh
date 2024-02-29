#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

function main() {
    if [[ $# -lt 2 ]]; then 
        return 1;
    fi
    local tex_file=$1
    local tex_stem=${tex_file%.tex}
    local fls_file="${tex_stem}.fls"
    local figure_dir=$1
    # pdflatex --recorder "$tex_file"
    {
        while read path; do
            realpath --relative-to "$PWD" $path;
        done < <( awk '/INPUT .+\.(pdf|png|jpg|jpeg)/ {print $2}' "$fls_file" )
    } | sort | uniq
}

main "$@"

