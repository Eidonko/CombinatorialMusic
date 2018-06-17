#!/usr/bin/env bash

timidity=/c/timidity/timidity 

if [[ "$#" -ne 1 ]] ; then
   echo "Please insert a string whose number of characters is a multiple of 3"
   read perm
else
   perm=$1
fi

l=${#perm}

if [ $(( l % 3 )) -ne 0 ] ; then
    echo "Your string has a number of characters that is not a multiple of 3"
	exit 1
fi

echo Processing permutations of $perm

perm $perm > $perm.dat 

if [[ "$?" -ne 0 ]] ; then
    echo "perm $perm failed ($?) -- aborting execution"
	exit 2
fi

# remove "-l" to print the score
data2lily -i $perm.dat -o $perm.ly -m celesta -m glockenspiel -m kalimba -l

if [ $? -ne 0 ]; then
    echo "data2lily -i $perm failed -- aborting execution"
	exit 3
fi

lilypond $perm.ly

if [ $? -ne 0 ]; then
    echo "lilypond $perm.ly failed -- aborting execution"
	exit 4
fi

$timidity $perm.mid -O w -o $perm.wav

if [ $? -ne 0 ]; then
    echo "timidity $perm.mid failed -- aborting execution"
	exit 5
fi

lame --quiet --abr 160k $perm.wav $perm.mp3 && rm -f $perm.wav
