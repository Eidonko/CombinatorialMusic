# CombinatorialMusic
Permutations can be considered as the orbits of a dynamic system p' = succ(p), where p is a permutation and p' is its successor in the lexycographically ordered set of permutations (+ Nil). This code translates those orbits into simple 3-voice music scores.

## Syntax

    $ ./permusic.sh _string_

where _string_ is a string of digits with a length that is a multiple of 3.

Try for instance:

    $ ./permusic.sh 001111122

This generates 001111122.ly (Lilypond source), 001111122.pdf (pdf score), 001111122.mid (MIDI score), and 001111122.mp3 (mp3 of the score):

    $ permusic.sh 001112222
    Processing permutations of 001112222
    Processing `001112222.ly'
    Parsing...
    Interpreting music...[8][16][24][32][40][48][56][64][72][80][88][96][104][112][120][128][136][144][152][160][168][176][184][192][200][208][216][224][232][240][248][256][264][272][280][288][296][304][312]
    Preprocessing graphical objects...
    Interpreting music...
    MIDI output to `001112222.mid'...
    Finding the ideal number of pages...
    Fitting music on 7 or 8 pages...
    Drawing systems...
    Layout output to `001112222.ps'...
    Converting to `./001112222.pdf'...
    Success: compilation successfully completed
    Playing 001112222.mid
    MIDI file: 001112222.mid
    Format: 1  Tracks: 4  Divisions: 384
    Sequence: control track
    Text: creator:
    Text: GNU LilyPond 2.18.2
    Playing time: ~319 seconds
    Notes cut: 0
    Notes lost totally: 0

Output of this very example is available on https://soundcloud.com/user-373798924/001112222a .

## Requirements
Note: permusic.sh requires

- lilypond 2.8 (http://lilypond.org/)
- timidity (http://timidity.sourceforge.net/)
- lame (http://lame.sourceforge.net/download.php) or another wav-to-mp3 converter

## More information
mailto://Eidon@tutanota.com
