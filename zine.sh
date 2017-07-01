#!/usr/bin/env bash

zinedir=$(dirname $0)
output="$zinedir/full.png"
cd $zinedir

help_Text(){
    echo "Usage: ./zine.sh [OPTIONS]"
    echo "e.g. ./zine.sh -g"
    echo "  -g          generate examples"
    echo "  -d          display after making"
    echo "  -o [ file ] define output"
    echo "  -h          This text"
    echo "Use this utility to make and break zines"
    echo "CC-0 NfN Orange"
}

make_sample(){
    convert -background white -fill black -size 877x1240 -pointsize 100  -gravity center label:$1 input/$1.png 
}

generate_samples(){
    make_sample 00
    make_sample 01
    make_sample 02
    make_sample 03
    make_sample 04
    make_sample 05
    make_sample 06
    make_sample 07
}

compile_images(){
convert -size 3508x2480 xc:white \
        -draw "affine -1,0,0,-1, 877,1240 image over 0,0 0,0 'input/01.png' " \
        -draw "affine -1,0,0,-1,1754,1240 image over 0,0 0,0 'input/02.png' " \
        -draw "affine -1,0,0,-1,2631,1240 image over 0,0 0,0 'input/03.png' " \
        -draw "affine -1,0,0,-1,3508,1240 image over 0,0 0,0 'input/04.png' " \
        -draw "affine  1,0,0, 1,   0,1240 image over 0,0 0,0 'input/00.png' " \
        -draw "affine  1,0,0, 1, 877,1240 image over 0,0 0,0 'input/07.png' " \
        -draw "affine  1,0,0, 1,1754,1240 image over 0,0 0,0 'input/06.png' " \
        -draw "affine  1,0,0, 1,2631,1240 image over 0,0 0,0 'input/05.png' " \
        $output 
}

while [ "$#" -gt 0 ]; do
    case "$1" in
		-d)
            displayZine="1" 
            echo "Displaying enabled"
            ;;
        -g) 
            echo "Samples enabled"
            samples="1" 
            ;;
        -h)
            help_Text ;;
		-o) shift 
            echo "Self chosen output enabled"
            output="${1}" 
            ;;
        *) 
            echo "Unknown ${1}"
            helpText
            exit 0
            ;;
    esac
    shift
done

if [ $samples ]; then generate_samples; fi
compile_images
if [ $displayZine ]; then display $output; fi
