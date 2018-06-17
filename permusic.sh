#!/usr/bin/env bash

timidity=/c/timidity/timidity 

if [[ "$#" -ne 1 ]] ; then
   echo "Please insert a string whose number of characters is a multiple of 3"
   read perm
else
   perm=$1
fi

echo Processing permutations of $perm
l=${#perm}

if [ $(( l % 3 )) -ne 0 ] ; then
    echo "Your string has a number of characters that is not a multiple of 3"
	exit 1
fi

perm $perm > $perm.dat 

data2lily -i $perm.dat -o $perm.ly -m glockenspiel -m harp -m celesta

lilypond $perm.ly

$timidity $perm.mid -O w -o $perm.wav

lame --quiet --abr 160k $perm.wav $perm.mp3 && rm -f $perm.wav
