#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXN  20000

void Trk(int[], int, FILE*);

int header(char*, FILE*);
int footer(int, int, char*, FILE*);

int main(int argc, char *argv[]) {
    FILE *f, *g;
    int retval;
    int *pxn;
    int *pyn;
    int *pzn;
	int *notes[3];
    int i, n;
    char *instruments[4];
	char *input, *output;
	int insp;
	int tempo, beat;

    instruments[0] = "celesta",
	instruments[1] = "glockenspiel",
	instruments[2] = "harp";

	input = output = NULL;
	insp = 0;
	tempo = 4;
	beat = 240;

    for (i=1; i<argc; i++) {
		if ( argv[i][0] == '-' ) {
			switch (argv[i][1]) {
			case 'i':
				i++;
				if (i>=argc) {
					fprintf(stderr, "%s: option -i must be followed by the input filename\n", argv[0]);
					exit(-1);
				}
				input = argv[i];
				break;

			case 'o':
				i++;
				if (i>=argc) {
					fprintf(stderr, "%s: option -o must be followed by the output filename\n", argv[0]);
					exit(-1);
				}
				output = argv[i];
				break;

			case 'm':
				i++;
				if (i>=argc) {
					fprintf(stderr, "%s: option -m must be followed by a midi instrument name\n", argv[0]);
					exit(-1);
				}
				instruments[insp++] = argv[i];
				// printf("%d) -m %s\n", insp, argv[i]);
				if (insp > 3) {
					fprintf(stderr, "%s: option -m can be specified at most three times\n", argv[0]);
					exit(-2);
				}
				break;

			default:
				goto err;
			}
		}
		else {
err:		fprintf(stderr, "Wrong arguments.\nUsage: %s -i input -o output { -m midi-instrument }[0-3]\n", argv[0]);
			exit(-1);
		}
	}

    pxn = notes[0] = malloc(sizeof(int)*MAXN);
    pyn = notes[1] = malloc(sizeof(int)*MAXN);
    pzn = notes[2] = malloc(sizeof(int)*MAXN);
	if (!pxn || !pyn || !pzn) {
		fprintf(stderr, "%s: allocation failure\n", argv[0]);
		exit(-3);
	}

	if (input) {
		f = fopen(input, "r");
		if (f == NULL) {
			fprintf(stderr, "%s: can't open input file %s\n", argv[0], input);
			exit(-3);
		}
/*
		else {
			fprintf(stderr, "%s: input file %s successfully opened\n", argv[0], input);
		}
 */
	}
	else {
		fprintf(stderr, "%s: input file set to stdin\n", argv[0]);
		f = stdin;
	}

	fflush(stderr);

    do
    {
		retval = fscanf(f, "%d, %d, %d", pxn++, pyn++, pzn++);

		if (retval == 0 || retval == EOF || pxn - notes[0] >= MAXN) break;

    }	while (1);

    n = pxn - notes[0];

	if ( n >= MAXN ) {
		fprintf(stderr,
			"%s: input file specifies more than %d notes. Modify constant MAXN to allow more notes\n", argv[0], MAXN);
		exit(-4);
	}

	if (output) {
		g = fopen(output, "w");
		if (g == NULL) {
			fprintf(stderr, "%s: can't open output file %s\n", argv[0], output);
			exit(-4);
		}
/*
		else {
			fprintf(stderr, "%s: output file %s successfully opened\n", argv[0], output);
		}
 */
	}
	else {
		fprintf(stderr, "%s: output file set to stdout\n", argv[0]);
		g = stdout;
	}

	/* processing */
	header(input, g);

	fprintf(g, "\\score {\n");
    fprintf(g, "   <<\n");
    fprintf(g, "       <<\n");

	for (i=0; i<3; i++) {
		fprintf(g, "           \\new Staff {\n");
		fprintf(g, "           \\set Staff.instrumentName = #\"Voice %d\"\n", i+1);
		fprintf(g, "                <<\n");
		fprintf(g, "                   {\n");
        fprintf(g, "                      \\set midiInstrument = #\"%s\"\n", instruments[i]);
        fprintf(g, "                      \\clef bass\n");
        fprintf(g, "                      \\time 4/4\n");

			Trk(notes[i], n, g);

		fprintf(g, "                   }\n");
		fprintf(g, "                >>\n");
		fprintf(g, "           }\n");
	}

    fprintf(g, "       >>\n");
    fprintf(g, "   >>\n");
	//fprintf(g, "}\n");

	fprintf(g, "\\layout {\n");
	fprintf(g, "  \\context {\n");
	fprintf(g, "      \\Score\n");
	fprintf(g, "      \\override SystemStartBar.collapse-height = #30\n");
	fprintf(g, "    }\n");
	fprintf(g, "  }\n");

	fprintf(g, "\\midi { \\tempo %d=%d }\n", tempo, beat);
	fprintf(g, "}\n");
	fprintf(g, "%% EoF\n");

	return 0;
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

void Trk(int x[], int n, FILE *fd)
{
    int i;
    char *note;

    fprintf(fd, "  { ");
    fprintf(fd, "  \\clef bass ");
    for (i=0; i<n; i++)
    {
	note = i2note(x[i]);
	fprintf(fd, "%s ", note);
	if (i % 10 == 0) fprintf(fd, "\n      ");
    }
    fprintf(fd, "}\n");
}

int header(char *s, FILE *fd)
{
	fprintf(fd, "\\version \"2.18.0\"\n\n");
	fprintf(fd, "\\header {\n");
	fprintf(fd, "   title = \"%s\"\n", s);
	fprintf(fd, "   composer = \"Eidon@tutanota.com\"\n");
	fprintf(fd, "}\n\n");
}

/* EoF data2lily3new.c */
