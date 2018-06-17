\version "2.18.0"

\header {
   title = "001112222.dat"
   composer = "HeartQuake and Data2Lilypond"
}

\score {
   <<
       <<
           \new Staff {
           \set Staff.instrumentName = #"Voice 1"
                <<
                   {
                      \set midiInstrument = #"glockenspiel"
                      \clef bass
                      \time 4/4
  {   \set midiInstrument = #"glockenspiel" 
	  cis, 
      cis, cis, cis, cis, cis, cis, cis, cis, cis, cis, 
      cis, cis, cis, cis, d, d, d, d, d, d, 
      d, d, d, d, d, d, d, d, d, d, 
      d, d, d, d, dis, dis, dis, dis, dis, dis, 
      dis, dis, dis, dis, dis, dis, dis, dis, dis, e, 
      e, e, e, e, e, e, e, e, e, e, 
      e, e, e, e, e, e, e, e, e, e, 
      e, e, e, e, e, e, e, e, e, f, 
      f, f, f, f, f, f, f, f, f, f, 
      f, f, f, f, f, f, f, f, f, f, 
      f, f, f, f, f, f, f, f, f, f, 
      f, f, f, f, f, f, f, f, f, f, 
      f, f, f, f, f, f, f, f, f, f, 
      f, f, f, f, f, f, f, f, f, fis, 
      fis, fis, fis, fis, fis, fis, fis, fis, fis, fis, 
      fis, fis, fis, fis, fis, fis, fis, fis, fis, g, 
      g, g, g, g, g, g, g, g, g, g, 
      g, g, g, g, g, g, g, g, g, g, 
      g, g, g, g, g, g, g, g, g, g, 
      g, g, g, g, g, g, g, g, g, g, 
      g, g, g, g, g, g, g, g, g, g, 
      g, g, g, g, g, g, g, g, g, gis, 
      gis, gis, gis, gis, gis, gis, gis, gis, gis, gis, 
      gis, gis, gis, gis, gis, gis, gis, gis, gis, gis, 
      gis, gis, gis, gis, gis, gis, gis, gis, gis, gis, 
      gis, gis, gis, gis, gis, gis, gis, gis, gis, gis, 
      gis, gis, gis, gis, gis, gis, gis, gis, gis, gis, 
      gis, gis, gis, gis, gis, gis, gis, gis, gis, a, 
      a, a, a, a, a, a, a, a, a, a, 
      a, a, a, a, ais, ais, ais, ais, ais, ais, 
      ais, ais, ais, ais, ais, ais, ais, ais, ais, ais, 
      ais, ais, ais, ais, ais, ais, ais, ais, ais, ais, 
      ais, ais, ais, ais, b, b, b, b, b, b, 
      b, b, b, b, b, b, b, b, b, b, 
      b, b, b, b, b, b, b, b, b, b, 
      b, b, b, b, b, b, b, b, b, b, 
      b, b, b, b, b, b, b, b, b, b, 
      b, b, b, b, b, b, b, b, b, b, 
      b, b, b, b, c  c  c  c  c  c  
      c  c  c  c  c  c  c  c  c  c  
      c  c  c  c  c  c  c  c  c  c  
      c  c  c  c  cis  cis  cis  cis  cis  cis  
      cis  cis  cis  cis  cis  cis  cis  cis  cis  d  
      d  d  d  d  d  d  d  d  d  d  
      d  d  d  d  d  d  d  d  d  d  
      d  d  d  d  d  d  d  d  d  d  
      d  d  d  d  d  d  d  d  d  d  
      d  d  d  d  d  d  d  d  d  d  
      d  d  d  d  d  d  d  d  d  dis  
      dis  dis  dis  dis  dis  dis  dis  dis  dis  dis  
      dis  dis  dis  dis  dis  dis  dis  dis  dis  dis  
      dis  dis  dis  dis  dis  dis  dis  dis  dis  dis  
      dis  dis  dis  dis  dis  dis  dis  dis  dis  dis  
      dis  dis  dis  dis  dis  dis  dis  dis  dis  dis  
      dis  dis  dis  dis  dis  dis  dis  dis  dis  e  
      e  e  e  e  e  e  e  e  e  e  
      e  e  e  e  e  e  e  e  e  e  
      e  e  e  e  e  e  e  e  e  e  
      e  e  e  e  e  e  e  e  e  e  
      e  e  e  e  e  e  e  e  e  e  
      e  e  e  e  e  e  e  e  e  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  f  
      f  f  f  f  f  f  f  f  f  fis  
      fis  fis  fis  fis  fis  fis  fis  fis  fis  fis  
      fis  fis  fis  fis  fis  fis  fis  fis  fis  g  
      g  g  g  g  g  g  g  g  g  g  
      g  g  g  g  g  g  g  g  g  g  
      g  g  g  g  g  g  g  g  g  g  
      g  g  g  g  g  g  g  g  g  g  
      g  g  g  g  g  g  g  g  g  g  
      g  g  g  g  g  g  g  g  g  gis  
      gis  gis  gis  gis  gis  gis  gis  gis  gis  gis  
      gis  gis  gis  gis  gis  gis  gis  gis  gis  gis  
      gis  gis  gis  gis  gis  gis  gis  gis  gis  gis  
      gis  gis  gis  gis  gis  gis  gis  gis  gis  gis  
      gis  gis  gis  gis  gis  gis  gis  gis  gis  gis  
      gis  gis  gis  gis  gis  gis  gis  gis  gis  a  
      a  a  a  a  a  a  a  a  a  a  
      a  a  a  a  a  a  a  a  a  a  
      a  a  a  a  a  a  a  a  a  a  
      a  a  a  a  a  a  a  a  a  a  
      a  a  a  a  a  a  a  a  a  a  
      a  a  a  a  a  a  a  a  a  ais  
      ais  ais  ais  ais  ais  ais  ais  ais  ais  ais  
      ais  ais  ais  ais  ais  ais  ais  ais  ais  ais  
      ais  ais  ais  ais  ais  ais  ais  ais  ais  ais  
      ais  ais  ais  ais  ais  ais  ais  ais  ais  ais  
      ais  ais  ais  ais  ais  ais  ais  ais  ais  ais  
      ais  ais  ais  ais  ais  ais  ais  ais  ais  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  b  
      b  b  b  b  b  b  b  b  b  c' 
      c' c' c' c' c' c' c' c' c' c' 
      c' c' c' c' c' c' c' c' c' c' 
      c' c' c' c' c' c' c' c' c' c' 
      c' c' c' c' c' c' c' c' c' c' 
      c' c' c' c' c' c' c' c' c' c' 
      c' c' c' c' c' c' c' c' c' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' cis' 
      cis' cis' cis' cis' cis' cis' cis' cis' cis' d' 
      d' d' d' d' d' d' d' d' d' d' 
      d' d' d' d' d' d' d' d' d' d' 
      d' d' d' d' d' d' d' d' d' d' 
      d' d' d' d' d' d' d' d' d' d' 
      d' d' d' d' d' d' d' d' d' d' 
      d' d' d' d' d' d' d' d' d' cis, 
      c, }
                   }
                >>
           }
           \new Staff {
           \set Staff.instrumentName = #"Voice 2"
                <<
                   {
                      \set midiInstrument = #"harp"
                      \clef bass
                      \time 4/4
  {   \set midiInstrument = #"harp"
	  d  
      e  f  f  f  ais  b  b  b  cis' cis' 
      cis' d' d' d' cis  d  d  d  e  e  
      e  f  f  f  ais  ais  ais  b  b  b  
      cis' cis' cis' d' d  e  f  f  f  ais  
      b  b  b  cis' cis' cis' d' d' d' f, 
      g, gis, gis, gis, b, dis  f  f  f  g  
      gis  gis  gis  a  b  b  b  c' c' c' 
      cis' cis' cis' d' d' d' d' d' d' e, 
      f, f, f, g, g, g, gis, gis, gis, ais, 
      b, b, b, c  d  d  d  dis  dis  dis  
      e  e  e  f  f  f  f  f  f  g  
      g  g  gis  gis  gis  a  a  a  ais  ais  
      ais  b  b  b  b  b  b  c' c' c' 
      cis' cis' cis' cis' cis' cis' d' d' d' cis  
      d  d  d  e  e  e  f  f  f  ais  
      ais  ais  b  b  b  cis' cis' cis' d' e, 
      f, f, f, g, g, g, gis, gis, gis, ais, 
      b, b, b, c  d  d  d  dis  dis  dis  
      e  e  e  f  f  f  f  f  f  g  
      g  g  gis  gis  gis  a  a  a  ais  ais  
      ais  b  b  b  b  b  b  c' c' c' 
      cis' cis' cis' cis' cis' cis' d' d' d' e, 
      e, e, f, f, f, g, g, g, gis, ais, 
      ais, ais, b, b, b, c  c  c  cis  cis  
      cis  d  d  d  d  d  d  dis  dis  dis  
      e  e  e  e  e  e  f  f  f  g  
      g  g  gis  a  a  a  ais  ais  ais  ais  
      ais  ais  b  b  b  c' cis' cis' cis' d  
      e  f  f  f  ais  b  b  b  cis' cis' 
      cis' d' d' d' f, g, gis, gis, gis, b, 
      dis  f  f  f  g  gis  gis  gis  a  b  
      b  b  c' c' c' cis' cis' cis' d' d' 
      d' d' d' d' e, f, f, f, g, g, 
      g, gis, gis, gis, ais, b, b, b, c  d  
      d  d  dis  dis  dis  e  e  e  f  f  
      f  f  f  f  g  g  g  gis  gis  gis  
      a  a  a  ais  ais  ais  b  b  b  b  
      b  b  c' c' c' cis' cis' cis' cis' cis' 
      cis' d' d' d' f, g, gis, gis, gis, b, 
      dis  f  f  f  g  gis  gis  gis  a  b  
      b  b  c' c' c' cis' cis' cis' d' d' 
      d' d' d' d' d, fis, gis, gis, gis, fis  
      gis  gis  gis  c' c' c' d' d' d' cis, 
      d, d, d, dis, f, f, f, fis, fis, fis, 
      g, g, g, gis, gis, gis, gis, gis, gis, a, 
      b, b, b, dis  dis  dis  f  f  f  fis  
      fis  fis  g  g  g  gis  gis  gis  gis  gis  
      gis  a  a  a  b  b  b  c' c' c' 
      c' c' c' cis' cis' cis' d' d' d' e, 
      f, f, f, g, g, g, gis, gis, gis, ais, 
      b, b, b, c  d  d  d  dis  dis  dis  
      e  e  e  f  f  f  f  f  f  g  
      g  g  gis  gis  gis  a  a  a  ais  ais  
      ais  b  b  b  b  b  b  c' c' c' 
      cis' cis' cis' cis' cis' cis' d' d' d' cis, 
      d, d, d, dis, f, f, f, fis, fis, fis, 
      g, g, g, gis, gis, gis, gis, gis, gis, a, 
      b, b, b, dis  dis  dis  f  f  f  fis  
      fis  fis  g  g  g  gis  gis  gis  gis  gis  
      gis  a  a  a  b  b  b  c' c' c' 
      c' c' c' cis' cis' cis' d' d' d' cis, 
      cis, cis, d, d, d, dis, dis, dis, e, e, 
      e, f, f, f, f, f, f, fis, fis, fis, 
      g, g, g, g, g, g, gis, gis, gis, a, 
      a, a, ais, ais, ais, b, b, b, b, b, 
      b, c  c  c  d  d  d  dis  dis  dis  
      dis  dis  dis  e  e  e  f  f  f  fis  
      fis  fis  g  g  g  g  g  g  gis  gis  
      gis  a  a  a  a  a  a  ais  ais  ais  
      b  b  b  c' c' c' cis' cis' cis' cis  
      d  d  d  e  e  e  f  f  f  ais  
      ais  ais  b  b  b  cis' cis' cis' d' e, 
      f, f, f, g, g, g, gis, gis, gis, ais, 
      b, b, b, c  d  d  d  dis  dis  dis  
      e  e  e  f  f  f  f  f  f  g  
      g  g  gis  gis  gis  a  a  a  ais  ais  
      ais  b  b  b  b  b  b  c' c' c' 
      cis' cis' cis' cis' cis' cis' d' d' d' e, 
      e, e, f, f, f, g, g, g, gis, ais, 
      ais, ais, b, b, b, c  c  c  cis  cis  
      cis  d  d  d  d  d  d  dis  dis  dis  
      e  e  e  e  e  e  f  f  f  g  
      g  g  gis  a  a  a  ais  ais  ais  ais  
      ais  ais  b  b  b  c' cis' cis' cis' e, 
      f, f, f, g, g, g, gis, gis, gis, ais, 
      b, b, b, c  d  d  d  dis  dis  dis  
      e  e  e  f  f  f  f  f  f  g  
      g  g  gis  gis  gis  a  a  a  ais  ais  
      ais  b  b  b  b  b  b  c' c' c' 
      cis' cis' cis' cis' cis' cis' d' d' d' cis, 
      d, d, d, dis, f, f, f, fis, fis, fis, 
      g, g, g, gis, gis, gis, gis, gis, gis, a, 
      b, b, b, dis  dis  dis  f  f  f  fis  
      fis  fis  g  g  g  gis  gis  gis  gis  gis  
      gis  a  a  a  b  b  b  c' c' c' 
      c' c' c' cis' cis' cis' d' d' d' cis, 
      cis, cis, d, d, d, dis, dis, dis, e, e, 
      e, f, f, f, f, f, f, fis, fis, fis, 
      g, g, g, g, g, g, gis, gis, gis, a, 
      a, a, ais, ais, ais, b, b, b, b, b, 
      b, c  c  c  d  d  d  dis  dis  dis  
      dis  dis  dis  e  e  e  f  f  f  fis  
      fis  fis  g  g  g  g  g  g  gis  gis  
      gis  a  a  a  a  a  a  ais  ais  ais  
      b  b  b  c' c' c' cis' cis' cis' e, 
      e, e, f, f, f, g, g, g, gis, ais, 
      ais, ais, b, b, b, c  c  c  cis  cis  
      cis  d  d  d  d  d  d  dis  dis  dis  
      e  e  e  e  e  e  f  f  f  g  
      g  g  gis  a  a  a  ais  ais  ais  ais  
      ais  ais  b  b  b  c' cis' cis' cis' cis, 
      cis, cis, d, d, d, dis, dis, dis, e, e, 
      e, f, f, f, f, f, f, fis, fis, fis, 
      g, g, g, g, g, g, gis, gis, gis, a, 
      a, a, ais, ais, ais, b, b, b, b, b, 
      b, c  c  c  d  d  d  dis  dis  dis  
      dis  dis  dis  e  e  e  f  f  f  fis  
      fis  fis  g  g  g  g  g  g  gis  gis  
      gis  a  a  a  a  a  a  ais  ais  ais  
      b  b  b  c' c' c' cis' cis' cis' cis, 
      cis, cis, d, dis, dis, dis, e, e, e, e, 
      e, e, f, f, f, fis, g, g, g, a, 
      a, a, ais, ais, ais, ais, ais, ais, b, b, 
      b, c  c  c  c  c  c  cis  cis  cis  
      d  d  d  dis  dis  dis  e  e  e  fis  
      g  g  g  a  a  a  ais  ais  ais  d  
      c, }
                   }
                >>
           }
           \new Staff {
           \set Staff.instrumentName = #"Voice 3"
                <<
                   {
                      \set midiInstrument = #"celesta"
                      \clef bass
                      \time 4/4
  {   \set midiInstrument = #"celesta"
	  d' 
      d' f  b  cis' d' f  b  cis' f  b  
      cis' d  e  ais  d' f  b  cis' f  b  
      cis' d  e  ais  f  b  cis' d  e  ais  
      d  e  ais  cis  d' d' f  b  cis' d' 
      f  b  cis' f  b  cis' d  e  ais  d' 
      d' f  b  cis' d' d' gis, gis  c' d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  d' 
      f  b  cis' f  b  cis' d  e  ais  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  d' 
      f  b  cis' f  b  cis' d  e  ais  f  
      b  cis' d  e  ais  d  e  ais  cis  d' 
      f  b  cis' f  b  cis' d  e  ais  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  f  
      b  cis' d  e  ais  d  e  ais  cis  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  d  
      e  ais  cis  d  e  ais  f, g, b, dis  
      g  a  e, ais, c  cis  e, ais, c  d' 
      d' f  b  cis' d' f  b  cis' f  b  
      cis' d  e  ais  d' d' f  b  cis' d' 
      d' gis, gis  c' d' f  b  cis' d' gis, 
      gis  c' f  b  cis' gis, gis  c' f, g, 
      b, dis  g  a  d' f  b  cis' f  b  
      cis' d  e  ais  d' f  b  cis' d' gis, 
      gis  c' f  b  cis' gis, gis  c' f, g, 
      b, dis  g  a  f  b  cis' d  e  ais  
      f  b  cis' gis, gis  c' f, g, b, dis  
      g  a  d  e  ais  f, g, b, dis  g  
      a  e, ais, c  d' d' f  b  cis' d' 
      d' gis, gis  c' d' f  b  cis' d' gis, 
      gis  c' f  b  cis' gis, gis  c' f, g, 
      b, dis  g  a  d' d' gis, gis  c' d' 
      gis, gis  c' gis, gis  c' d, fis, fis  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  d' 
      gis, gis  c' gis, gis  c' d, fis, fis  f  
      b  cis' gis, gis  c' f, g, b, dis  g  
      a  gis, gis  c' d, fis, fis  f, g, b, 
      dis  g  a  d, fis, fis  cis, dis, a, d' 
      f  b  cis' f  b  cis' d  e  ais  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  d' 
      gis, gis  c' gis, gis  c' d, fis, fis  f  
      b  cis' gis, gis  c' f, g, b, dis  g  
      a  gis, gis  c' d, fis, fis  f, g, b, 
      dis  g  a  d, fis, fis  cis, dis, a, f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  f  
      b  cis' gis, gis  c' f, g, b, dis  g  
      a  gis, gis  c' d, fis, fis  f, g, b, 
      dis  g  a  d, fis, fis  cis, dis, a, d  
      e  ais  f, g, b, dis  g  a  e, ais, 
      c  f, g, b, dis  g  a  d, fis, fis  
      cis, dis, a, e, ais, c  cis, dis, a, d' 
      f  b  cis' f  b  cis' d  e  ais  f  
      b  cis' d  e  ais  d  e  ais  cis  d' 
      f  b  cis' f  b  cis' d  e  ais  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  f  
      b  cis' d  e  ais  d  e  ais  cis  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  d  
      e  ais  cis  d  e  ais  f, g, b, dis  
      g  a  e, ais, c  cis  e, ais, c  d' 
      f  b  cis' f  b  cis' d  e  ais  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  d' 
      f  b  cis' d' gis, gis  c' f  b  cis' 
      gis, gis  c' f, g, b, dis  g  a  d' 
      gis, gis  c' gis, gis  c' d, fis, fis  f  
      b  cis' gis, gis  c' f, g, b, dis  g  
      a  gis, gis  c' d, fis, fis  f, g, b, 
      dis  g  a  d, fis, fis  cis, dis, a, f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  f  
      b  cis' gis, gis  c' f, g, b, dis  g  
      a  gis, gis  c' d, fis, fis  f, g, b, 
      dis  g  a  d, fis, fis  cis, dis, a, d  
      e  ais  f, g, b, dis  g  a  e, ais, 
      c  f, g, b, dis  g  a  d, fis, fis  
      cis, dis, a, e, ais, c  cis, dis, a, f  
      b  cis' d  e  ais  d  e  ais  cis  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  d  
      e  ais  cis  d  e  ais  f, g, b, dis  
      g  a  e, ais, c  cis  e, ais, c  f  
      b  cis' d  e  ais  f  b  cis' gis, gis  
      c' f, g, b, dis  g  a  d  e  ais  
      f, g, b, dis  g  a  e, ais, c  f  
      b  cis' gis, gis  c' f, g, b, dis  g  
      a  gis, gis  c' d, fis, fis  f, g, b, 
      dis  g  a  d, fis, fis  cis, dis, a, d  
      e  ais  f, g, b, dis  g  a  e, ais, 
      c  f, g, b, dis  g  a  d, fis, fis  
      cis, dis, a, e, ais, c  cis, dis, a, d  
      e  ais  cis  d  e  ais  f, g, b, dis  
      g  a  e, ais, c  cis  e, ais, c  d  
      e  ais  f, g, b, dis  g  a  e, ais, 
      c  f, g, b, dis  g  a  d, fis, fis  
      cis, dis, a, e, ais, c  cis, dis, a, cis  
      e, ais, c  e, ais, c  cis, dis, a, d' 
      c, }
                   }
                >>
           }
       >>
   >>
\layout {
  \context {
      \Score
      \override SystemStartBar.collapse-height = #30
    }
  }
\midi { \tempo 4=240 }
}
% EoF
