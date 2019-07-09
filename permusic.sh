#!/usr/bin/env bash

#timidity=/c/timidity/timidity 

if [[ "$#" -ne 1 ]] ; then
   echo "Please insert a string whose number of characters is a multiple of 3"
   read permstring
else
   permstring=$1
fi

l=${#permstring}

if [ $(( l % 3 )) -ne 0 ] ; then
    echo "Your string has a number of characters that is not a multiple of 3"
	exit 1
fi

echo Processing permutations of $permstring

echo "perm $permstring > $permstring.dat" 
perm $permstring > $permstring.dat 

res="$?"

if [ "$res" != "1" ] ; then
    echo "perm $permstring failed ($res) -- aborting execution"
	exit 2
fi

# add "-l" to avoid printing the score
data2lily -i $permstring.dat -o $permstring.ly -m celesta -m glockenspiel -m kalimba

if [ "$?" -ne "0" ]; then
    echo "data2lily -i $permstring failed -- aborting execution"
	exit 3
fi

lilypond $permstring.ly

if [ "$?" -ne "0" ]; then
    echo "lilypond $permstring.ly failed -- aborting execution"
	exit 4
fi

timidity $permstring.midi -O w -o $permstring.wav

if [ "$?" -ne "0" ]; then
    echo "timidity $permstring.mid failed -- aborting execution"
	exit 5
fi

lame --quiet --abr 160k $permstring.wav $permstring.mp3 && rm -f $permstring.wav
