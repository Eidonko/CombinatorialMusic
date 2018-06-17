#!/usr/bin/env bash
if [[ "$#" -ne 1 ]] ; then
   echo "Please insert a string"
   read perm
else
   perm=$1
fi

echo $perm

perm $perm > $perm.dat 
data2lily -i $perm.dat -o $perm.ly -m glockenspiel -m harp -m celesta

lilypond $perm.ly

/c/timidity/timidity $perm.mid -O w -o $perm.wav

lame --abr 160k $perm.wav $perm.mp3
