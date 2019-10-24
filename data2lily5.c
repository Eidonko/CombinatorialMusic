#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define MAXN  1024

void Trk(int[], int, char*);

int header(char *);

void midi(char*);

int
main(int argc, char *argv[])
{
    FILE *f;
    int retval;
    int *xn, *pxn;
    int *yn, *pyn;
    int *zn, *pzn;
    int n;

    if (argc < 2)
    {
	fprintf(stderr, "Data2Lily4: wrong usage\n");
	fprintf(stderr, "Usage: data2lily4 notefile [midiInstr1] [midiInstr2] [midiInstr3]\n");
	exit(-1);
    }

    pxn = xn = malloc(sizeof(int)*MAXN);
    pyn = yn = malloc(sizeof(int)*MAXN);
    pzn = zn = malloc(sizeof(int)*MAXN);

    f = fopen(argv[1], "r");
    assert (f != NULL);

    do
    {
	retval = fscanf(f, "%d, %d, %d", pxn++, pyn++, pzn++);

	if (retval == 0 || retval == EOF || pxn - xn >= MAXN) break;

    }	while (1);

    n = pxn - xn;

    assert (n <= MAXN);

	header(argv[1]);

printf("\\version \"2.18.2\"\n");

	printf("\\score {\n");
printf("\\new Staff <<\n");
	//printf("\\notes <<\n");

if (argc >=2)
    Trk(xn, n, argv[2]);
else
    Trk(xn, n, "glockenspiel");

if (argc >=3)
    Trk(yn, n, argv[3]);
else
    Trk(yn, n, "contrabass");


if (argc >=4)
    Trk(zn, n, argv[4]);
else
    Trk(zn, n, "melodic tom");


	printf(">>\n\n");
	printf("\\layout { }\n");
	//printf("\\midi { \\tempo 4=240 }\n");
	midi("4=240");
	printf("}\n\n");
}



char *i2note(int n)
{
    int oct = n / 12;
    int i;
    n %= 12;
    static char retval[15];
    char *soct;

    if (oct == 0)
	soct = ",";
    else if (oct == 1)
	soct = " ";
    else if (oct == 2)
	soct = "\'";
    else if (oct == 3)
	soct = "\'\n";
    else if (oct == 4)
	soct = "\'\'\n";
    else if (oct == 5)
	soct = "\'\'\'\n";
    else 
	soct = "\'";



    switch(n)
    {
    case 0:
	retval[0] = 'c';
	strcpy(retval+1, soct);
	break;
    case 1:
	retval[0] = 'c';
	retval[1] = 'i';
	retval[2] = 's';
	strcpy(retval+3, soct);
	break;
    case 2:
	retval[0] = 'd';
	strcpy(retval+1, soct);
	break;
    case 3:
	retval[0] = 'd';
	retval[1] = 'i';
	retval[2] = 's';
	strcpy(retval+3, soct);
	break;
    case 4:
	retval[0] = 'e';
	strcpy(retval+1, soct);
	break;
    case 5:
	retval[0] = 'f';
	strcpy(retval+1, soct);
	break;
    case 6:
	retval[0] = 'f';
	retval[1] = 'i';
	retval[2] = 's';
	strcpy(retval+3, soct);
	break;
    case 7:
	retval[0] = 'g';
	strcpy(retval+1, soct);
	break;
    case 8:
	retval[0] = 'g';
	retval[1] = 'i';
	retval[2] = 's';
	strcpy(retval+3, soct);
	break;
    case 9:
	retval[0] = 'a';
	strcpy(retval+1, soct);
	break;
    case 10:
	retval[0] = 'a';
	retval[1] = 'i';
	retval[2] = 's';
	strcpy(retval+3, soct);
	break;
    case 11:
	retval[0] = 'b';
	strcpy(retval+1, soct);
	break;
    }
    return retval;
}

void Trk(int x[], int n, char *instr)
{
    int i;
    char *note;
    char prevnote[15];
    static char voicenum;

  printf("\\new Voice {   \\set midiInstrument = #\"%s\"\n", instr);
  switch(++voicenum) {
  case 1: printf("\\voiceOne\n"); break;
  case 2: printf("\\voiceTwo\n"); break;
  case 3: printf("\\voiceThree\n"); break;
  case 4: printf("\\voiceFour\n"); break;
  case 5: printf("\\voiceFive\n"); break;
  default: fprintf(stderr, "Max five voices -- aborting\n"); exit(-1);
  }

    printf("  \\clef bass ");

     strcpy(prevnote, i2note(x[0]));
     printf("%s ", prevnote);

    for (i=1; i<n; i++)
    {
	note = i2note(x[i]);
	if (strcmp(note, prevnote) == 0) printf("~ ");
	printf("%s ", note);
        strcpy(prevnote, note);

	if (i % 10 == 0) printf("\n      ");
    }
    printf("}\n");
}

int header(char *s)
{
	printf("\\header {\n");
	printf("   title = \"%s\"\n", s);
	printf("   composer = \"FractalSocialOrganizations and Data2Lilypond3\"\n");
	printf("}\n\n");
}

void midi(char* tempo)
{
printf("\\midi {\n");
printf("  \\context {\n");
printf("      \\Staff\n");
printf("      \\remove \"Staff_performer\"\n");
printf("    }\n");
printf("    \\context {\n");
printf("      \\Voice\n");
printf("      \\consists \"Staff_performer\"\n");
printf("    }\n");
printf("    \\tempo %s\n", tempo);
printf("}\n");

}
