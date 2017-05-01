#!/bin/bash
generate_samples(){
    convert -background yellow    -fill white  -font Liberation-Sans \ 
    -size 877x1240 -pointsize 100  -gravity center label:00 00.png 
    convert -background orange    -fill white  -font Liberation-Sans \ 
    -size 877x1240 -pointsize 100  -gravity center label:01 01.png 
    convert -background orangered -fill white  -font Liberation-Sans \
    -size 877x1240 -pointsize 100  -gravity center label:02 02.png 
    convert -background red       -fill white  -font Liberation-Sans \ 
    -size 877x1240 -pointsize 100  -gravity center label:03 03.png 
    convert -background purple    -fill white  -font Liberation-Sans \ 
    -size 877x1240 -pointsize 100  -gravity center label:04 04.png 
    convert -background violet    -fill white  -font Liberation-Sans \ 
    -size 877x1240 -pointsize 100  -gravity center label:05 05.png 
    convert -background blue      -fill white  -font Liberation-Sans \ 
    -size 877x1240 -pointsize 100  -gravity center label:06 06.png 
    convert -background green     -fill white  -font Liberation-Sans \
    -size 877x1240 -pointsize 100  -gravity center label:07 07.png 
}
compile_images(){
convert -size 3508x2480 xc:white \
        -draw "affine -1,0,0,-1, 877,1240 image over 0,0 0,0 '01.png' " \
        -draw "affine -1,0,0,-1,1754,1240 image over 0,0 0,0 '02.png' " \
        -draw "affine -1,0,0,-1,2631,1240 image over 0,0 0,0 '03.png' " \
        -draw "affine -1,0,0,-1,3508,1240 image over 0,0 0,0 '04.png' " \
        -draw "affine  1,0,0, 1,   0,1240 image over 0,0 0,0 '00.png' " \
        -draw "affine  1,0,0, 1, 877,1240 image over 0,0 0,0 '07.png' " \
        -draw "affine  1,0,0, 1,1754,1240 image over 0,0 0,0 '06.png' " \
        -draw "affine  1,0,0, 1,2631,1240 image over 0,0 0,0 '05.png' " \
        full.png 
}
compile_images
display full.png
