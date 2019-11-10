# CombinatorialMusic
The idea is simple: I consider generation of permutations as a dynamic process in which a successor permutation p' is generated from an input permutation p.

I take those orbits, I break them into three chunks, map each chunk to a note, and play the three notes together -- that's it.

The thing that strikes me is that this gives rise to patterns that, at least to me, seem interesting. An example is 001112222, available on my soundcloud account: https://soundcloud.com/user-373798924/001112222a and as a MuseScore file at https://musescore.com/user/29896662/scores/5638047

This non-triviality may be due to the fractal nature of the process. In fact, when mapping the same process on a 3D space, I get images that are self-similar and, according to the Fractalyse tool, are characterised by a fractal dimension (see e.g. https://www.dropbox.com/s/rrjqrffx9bqzuxh/001112222.jpg?dl=0; image produced with https://github.com/Eidonko/Permutation-feed-povray).

## News

### Czech composer Flavigula has published a piece of music that uses my approach!
Here is their "Šest": https://exode.me/videos/watch/95c0f6a2-2423-4189-a6f9-5908e1efaf2c, and here is their announcement: https://sonomu.club/@flavigula/103096645941388869

![Flavigula's toot](https://github.com/Eidonko/CombinatorialMusic/blob/master/music-20191108.png)

### I received warms words of encouragement from another musician, JS0000
I'm very grateful, as this encourages me to do more and better! https://sonomu.club/@js0000/103109313152388102

![Js0000's toot](https://github.com/Eidonko/CombinatorialMusic/blob/master/music-20191110.png)


### I have been collecting a number of compositions that are based on my approach. 
They may be found in this videolist: https://open.tube/my-account/video-playlists/94a9f75c-b2b3-4641-8f67-b94aa30960b0 and on youtube in my "Eidon' Songs" channel. Here is partial list:

- Let Me Know https://www.youtube.com/watch?v=Rtgdt55xEKo&list=PLX1ONCEToSxDfoL_i-vphvjvg0ozlEnBB&index=36
- Inugami https://www.youtube.com/watch?v=HZjsyeUanrU&list=PLX1ONCEToSxDfoL_i-vphvjvg0ozlEnBB&index=38
- Gentle Giant https://www.youtube.com/watch?v=fso05O88GiY&list=PLX1ONCEToSxDfoL_i-vphvjvg0ozlEnBB&index=39
- Ipcress https://www.youtube.com/watch?v=Bk-28uow8f4&list=PLX1ONCEToSxDfoL_i-vphvjvg0ozlEnBB&index=40
- Haïka a déjà d'... https://www.youtube.com/watch?v=Bk-28uow8f4&list=PLX1ONCEToSxDfoL_i-vphvjvg0ozlEnBB&index=41
- Le Capitaine Fracasse https://www.youtube.com/watch?v=Bk-28uow8f4&list=PLX1ONCEToSxDfoL_i-vphvjvg0ozlEnBB&index=42

I call the above compositions **Grundgestalts**, because this is the term introduced by Schönberg for this class of generative processes. I find this quote particularly interesting and enlightening:

> "Whatever happens in a piece of music is the endless reshaping of the basic shape ...
> There is nothing in a piece of music but what
> comes from the theme,
> springs from it and
> can be traced back to it;
> to put it still more severely, nothing but the theme itself"
>          (Arnold Schönberg, ‘Linear Counterpoint’, 1950).

This is in fact what happens with the music generated here: the first chord is x, the second f(x), the third f(f(x)), and so forth. Everything is pre-dermined and springs from the theme, x.


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

## ...In more details
permusic.sh and permusic_nopdf.sh execute as a pipeline of processes:

- perm _string_ creates a file of "triplets": integers translating a permutation into three comma-separated integers corresponding to the three chunks mentioned at the top. Let me call this file "the datfile"
- data2lily -i _datfile_ -o _lilypondfile_ -m '_instrument1_' -m '_instrument2_' -m '_instrument3_' : this one converts the _datfile_ into the Lilypond source _lilypondfile_, specifying as MIDI instruments _instrument*_
- lilypond _lilypondfile_ : creates the MIDI file and (when using permusic.h) tries to create a PDF score
- timidity _midifile_ -O w _wavfile_ : converts the MIDI file into a WAV file
- lame --abr 160k _wavfile_ _mp3file_ : converts the WAV file into an MP3 file

The WAV file is then deleted.

## Requirements
Note: permusic.sh requires

- Lilypond 2.8 (http://lilypond.org/)
- TiMidity (http://timidity.sourceforge.net/)
- Lame (http://lame.sourceforge.net/download.php) or another wav-to-mp3 converter

Note: TiMidity requires soundfonts and a proper configuration thereof. I would suggest you to follow the guidelines at https://www.rosegardenmusic.com/wiki/setting_up_the_fluidr3_gm.sf2_for_timidity.

## More information
Feel free to contact me at Eidon@tutanota.com

# Versions
- V0.1 2018-06-17:
    Added options -L (with layout; default) and -l (without layout). When calling lily2data with -l, score is not printed and only the midi file is created.
    Now permusic.sh stops when one of the production stages fail.
    New script permusic_nopdf.sh is the same as permusic.h but option -l is issued for lily2data (see above).
- V0.2 2019-07-09:
    Removed bug in permusic.sh and in Makefile
    Improved README.md
