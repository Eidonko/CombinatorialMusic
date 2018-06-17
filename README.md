# CombinatorialMusic
Permutations can be considered as the orbits of a dynamic system p' = succ(p), where p is a permutation and p' is its successor in the lexycographically ordered set of permutations (+ Nil). This code translates those orbits into simple 3-voice music scores.

Syntax:
    $ ./permusic.sh _string_

where _string_ is a string of digits with a length that is a multiple of 3.

Try for instance
    $ ./permusic.sh 001111122

This generates 001111122.ly (Lilypond source), 001111122.pdf (pdf score), 001111122.mid (MIDI score), and 001111122.mp3 (mp3 of the score)

Note: requires

- lilypond 2.8 (http://lilypond.org/)
- timidity (http://timidity.sourceforge.net/)
- lame (http://lame.sourceforge.net/download.php) or another wav-to-mp3 converter

