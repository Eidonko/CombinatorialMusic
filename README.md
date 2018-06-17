# CombinatorialMusic
The idea is simple: I consider generation of permutations as a dynamic process in which a successor permutation p' is generated from an input permutation p according to the process described in https://www.slideshare.net/VincenzoDeFlorio/turing-permutations

I take those orbits, I break them into three chunks, map each chunk to a note, and play the three notes together -- that's it.

The thing that strikes me is that this gives rise to patterns that, at least to me, seem interesting. An example is 001112222, available on my soundcloud account: https://soundcloud.com/user-373798924/001112222a

This non-triviality may be due to the fractal nature of the process. In fact, when mapping the same process on a 3D space, I get images that are self-similar and, according to the Fractalyse tool, are characterised by a fractal dimension (see e.g. https://www.dropbox.com/s/rrjqrffx9bqzuxh/001112222.jpg?dl=0; image produced with https://github.com/Eidonko/Permutation-feed-povray).

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
Feel free to contact me at Eidon@tutanota.com
