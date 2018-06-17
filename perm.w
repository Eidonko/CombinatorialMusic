% M: Permutations with repetitions, by Vincenzo De Florio, 1995

\nocon % omit table of contents
%\datethis % print date on listing
\pageno12
\def\overlinedR{\hbox{$\overline R$}}
\def\cardA{\hbox{card${}_{A}$}}
\def\cardM{\hbox{card${}_{M}$}}
\def\multisetM{\hbox{$M$}}
\def\pl{\hbox{Head${}_{\eightrm left}$}}
\def\pr{\hbox{Head${}_{\eightrm right}$}}
\def\Left{\hbox{the leftmost symbol of permutation $\multisetM$ i.e., $v$}}
\def\pprime{\hbox{$p'$}}

@f overlinedR TeX
@f cardA      TeX	
@f cardM      TeX	
@f multisetM  TeX	
@f pl         TeX
@f pr         TeX
@f Left       TeX
@f pprime     TeX

@* Permutations of a Multiset.
Here it is presented a C language function
for generating the successor of a given permutation according
to the algorithm discussed in \S2.
The multiset to be permuted is |M|. Function |successor()|
gets permutation $p$ and produces $p'$. Alphabet
|A| is normalized into the set of the first $m$ integer numbers.
A |main()| procedure recursively calls function |successor()|
up to |NULL| so to produce permutations from $p_0^M$ to $p_{\infty}^M$.

@d MAIN1 main1
@d MAIN2 main2
@d MAIN3 main

@c

@<prologo@>@/
@<global variables@>@/
@<successor permutation function@>@/
@<initialization and normalization@>@/
@<test main 1@>@/
@<test main 2@>@/
@<test main 3@>@/



@ Starting section: headers, constants, and global variables.
In particular it is defined constant |EOP| (which stands for 
``\.{End Of Permutations}''), constant |MAX_MULTISET_CARD|,
an upper threshold for $n=\cardM$, and costant 
|MAX_ALPHABET_CARD|, an upper threshold for $m=\cardA$.

@d EOP        NULL
@d MAX_MULTISET_CARD   100
@d MAX_ALPHABET_CARD   10
@<prologo@>=

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <assert.h>

@ A little set of global variables so to minimize the parameter
exchange in function calls.
|M| is the string to be permuted, whose length is |cardM| byte (up to
|MAX_MULTISET_CARD|). |overlinedR| counts the occurences of each digit, so
it disposes of |cardA| cells. The |offset| variable is used to normalize
back and forth the permuted string.

@<global variables@>=
char M[MAX_MULTISET_CARD];	/* multiset $M$ */
int  cardM;			/* $n$ i.e., its cardinality */
unsigned char *overlinedR;	/* multisubset $\overline R$ */
int cardA;	/* $m$, or the number of different symbols in Alphabet $A$ */

int offset;	/* ascii($a_1$), used for normalizing $M$ to $[0,\dots m-1]$ */
void printv(char*);
void printv1v2(char*);
void printv1v2v3(char*);
void printv1v2v3v4(char*);
void err(char*);



@* The successor operator.
Some sort of a Turing machine with two contiguous heads,
|pl| and |pr|, initially positioned on the last two characters
on the right end of the permutation.
They move leftward looking for a couple which is {\it not\/}
an inversion i.e. |*pl| is less than |*pr|. As they travel
across the string, |overlinedR| records the occurrences
of encountered characters. 
If a non-inversion is found,
$a_i$ stands below |pl|. It is substituted by the minimum
$a_k$ in |overlinedR| which is greater than $a_i$.
Then |overlinedR| is linearly scanned producing a zero
permutation of $\overline R$.
If all couples are inversions the string is decreasingly ordered
i.e., is a $p_{\infty}$ in which case |successor()| returns |EOP|.

@d Left v

@<successor...@>=
char* successor(char *v, int len)
{
  char *pl, *pr;
  int i, j, k;

  pl = &v[len-2], pr = &v[len-1]; /* move the head on the right end of |v| */
  bzero((char*)overlinedR, cardA); /*  $R\leftarrow\emptyset$ */

  @<inspect the permutation right-to-left looking for a non-inversion in $a_i$@>@;


  if (pr==Left)    /* no inversion means $p=p_{\infty}$, so $p'=\Lambda$ */
	return EOP;


  overlinedR[*pl]++; 		/* $R\cup\{a_i\}$ */

  @<looks for a $k$ which is the minimum $j$ such that $a_j>a_i$@>@;

  overlinedR[k]--;    /* $\{a_i\}\cup {\cal C}_R\{a_k\}$ */
  *pl++    = k;		/* $a_i \leftarrow a_k$ */

  @<builds $p_0^{\overline R}$@>@;

  return v;
}





@ Move the heads up to a couple (|pl|,|pr|) such that |*pl < *pr|
or the left end of the permutation.
Vector |overlinedR[]| counts the occurences of visited symbols.

@<inspect...@>=
while (pr != Left)
  {
    overlinedR[*pr]++;	  /* add the symbol to $\overline R$ */

    /* if (*pl-- < *pr--) break; /* shift to left both |pr| and |pl| */

    if (*pl < *pr) break;
    pr = pl--;
    /* alternatively, |if (*pl < *pr) break;|
                      |pr = pl--;|
     */
  }



@ if (|*pl|,|*pr|) is {\it not\/} an inversion then we need
to substitute |pl| (i.e., $a_i$) with the minimum of its
majorants.

@<looks for...@>=
for (k = *pl + 1; k<cardM; k++)
   if (overlinedR[k]) break;



@ Closings: we substituted $a_k$ for $a_i$ and now we
build an ordered postfix string i.e., a zero for $\overline R$.
This is made easy because we dispose of |overlinedR| which
orderly counts the occurrence of the symbols in $\overline R$.

@<builds...@>=
for (i=0; i<cardA; i++)
  for (j=0; j<overlinedR[i]; j++)
    *pl++ = i;


@ Prints a permutation and computes $\nu(p)$.
@c
void printv(char *v) {
int i;
long l;
static long old_l;
static FILE *f;
static int num;

if (f==NULL) f=fopen("istogramma", "w");
if (f==NULL) err("can't open istogramma");

++num;
#define QUANTUM 1871100
if(num % QUANTUM == 0 || num % QUANTUM == 1)
	printf("%d\t", num);

for (l=0L, i=0; i<cardM; i++) {
	l = l * cardA + v[i];
	if(num % QUANTUM == 0 || num % QUANTUM == 1)
		putchar(v[i]+offset);
}
if(num % QUANTUM == 0 || num % QUANTUM == 1)
putchar('\n');

/* questo stampa i #(p) - momentaneamente disabilitato!
	fprintf(f, "%d\n", l);
*/
/* questo stampa le differenze. Momentaneamente disabilitato!
	fprintf(f, "%ld\n", l-old_l);
*/
if (old_l)
	fprintf(f, "%f\n", log(l-old_l));
old_l=l;
/**/
}

int ptoa(char *p, int l, int base)
{
	int i, res;

	for (res=i=0; i<l; i++)
		res = res * base + p[i];
	return res;
} 

void printv1v2(char *v) {
int l;
l = cardM;
//printf("l==%d, M==`%s', v==`%s'\n", l, M, v);
assert (l % 2 == 0);
l >>= 1;
printf("%d, %d\n", ptoa(v, l, cardA), ptoa(v+l, l, cardA));
}

void printv1v2v3(char *v) {
int l;
l = cardM;
//printf("l==%d, M==`%s', v==`%s'\n", l, M, v);
assert (l % 3 == 0);
l /= 3;
printf("%d, %d, %d\n",
ptoa(v, l, cardA), ptoa(v+l, l, cardA), ptoa(v+l+l, l, cardA));
}

void printv1v2v3v4(char *v) {
int l;
l = cardM;
//printf("l==%d, M==`%s', v==`%s'\n", l, M, v);
assert (l % 4 == 0);
l /= 4;
printf("%d, %d, %d, %d\n",
ptoa(v, l, cardA), ptoa(v+l, l, cardA), ptoa(v+l+l, l, cardA), ptoa(v+3*l, l, cardA));
}

void dump(char* overlinedR) { int i;
printf("overlinedR=");
for (i = 0; i<cardM; i++)
   printf("%1d", overlinedR[i]);
printf("\n");
}

@ Initialization: the permutation is normalized, its length is
computed in |*sl|.

@<initial...@>=
 initialize(char *s, int *sl, int *cl, int *offset)
{
  int min, max;
  int i;
  char *p=s;
  char c;

  *sl = strlen(s);

  min=255, max=0;	
  while (c = *p++)
    {
      if (c<min) min = c;
      if (c>max) max = c;
    }
  
  *offset = min;	/* offset will be used by |printv()| */

  *cl = max - min + 1;	/* \cardA, or the number of classes */

  overlinedR = (unsigned char *)malloc(*cl);

  /* normalization in 0..max-min */
  for (i=0; i < *sl; i++)
    s[i] -= min;
}

@ error print procedure
@c
void err(char *s) 
{
 fprintf(stderr, "condizione di errore: \"%s\" - stop.\n", s);
 exit(-1);
}




@ A test main procedure.
Reads command line argument; initializes |M|, |cardM|, |cardA|, and
|offset|; recursively calls procedure |successor()| 
from |argv[1]| (not necessarily a zero permutation!) and up to |NULL|,
generating all permutations $p$ such that 
$\nu(p)\in[\nu($|argv[1]|$,\nu(p_{\infty})]$.


@<test main 1@>=
#ifndef LINDA
MAIN1(int argc, char *argv[])
{
   int i;

   if (argc != 2) err("arguments");

   strcpy(M, argv[1]);

   initialize(M, &cardM, &cardA, &offset);

   do {
#ifdef BI
     printv1v2(M);
#else
     printv1v2v3(M);
#endif
   } while (successor(M, cardM));
}
#endif


@ Another test main procedure.
Reads command line argument; initializes |M|, |cardM|, |cardA|, and
|offset|; recursively calls procedure |successor()| 
from |argv[1]| (not necessarily a zero permutation!) and up to |NULL|,
generating all permutations $p$ such that 
$\nu(p)\in[\nu($|argv[1]|$,\nu(p_{\infty})]$.

@<test main 2@>=
#ifdef LINDA

struct strobj { char s[30], sprime[30]; };
typedef struct strobj obj;

MAIN2(int argc, char *argv[])
{
   int i, status;
   obj o;
   int compute(obj);

   for (i=1; i<argc-1; i++) {
	strcpy(o.s, argv[i]);
	strcpy(o.sprime, argv[i+1]);
	eval(compute(o));
	}

   for (i=1; i<argc-1; i++)
	in(?status);
}

int compute(obj o)
{
   char *p=o.s;
   char *pprime=o.sprime;

   strcpy(M, p);
   initialize(M, &cardM, &cardA, &offset);
   do {
      ;
#ifdef BI
     printv1v2(M);
#else
     printv1v2v3(M);
#endif

	p = successor(M, cardM);
   }  while (strcmp(p, pprime)!=0);
}
#endif  /* LINDA */



@ Inter-Process Communication version.

@<test main 3@>=
/* IPC */
struct strobj { char s[30], sprime[30]; };
typedef struct strobj obj;

MAIN3(int argc, char *argv[])
{
   int i, status, f=0;
   obj o;
   int compute(obj);

   if (argc<2) err("args");

   if (argc == 2) { strcpy(o.s, argv[1]);
		    // strcpy(M, argv[1]);
		    strcpy(o.sprime, argv[1]);
		    compute(o);
   } else {
     for (i=1; i<argc-1; i++) {
         f=fork();

         switch(f) {
	  case -1: err("fork failed!");
		 exit(-1);

	  case 0:
		 fprintf(stderr, "fork %d running\n", i);
		      fflush(stderr);
	          strcpy(o.s, argv[i]);
	          strcpy(o.sprime, argv[i+1]);
	          compute(o);
		 fprintf(stderr, "child %d dies\n", i);
		 exit(i);
		      fflush(stderr);
		  return; /* NOT break!!!!!! */

	  default:
		 printf("process %d (pid=%d) started.\n", i, f);
		 break;
          }
      } /* endfor */

      fflush(stderr);
      for (i=1; i<argc-1; i++) 
	{ int x;
	printf("waiting process %d...\n",i);
	x=wait();
	printf("%d(%d) is done.\n", i, x);
	}
  } /* end else */

  return;
}

int compute(obj o)
{
   char *p=o.s;
   char *pprime=o.sprime;
   int i;

   strcpy(M, p);
   initialize(M, &cardM, &cardA, &offset);
//#ifdef PRINT
//   printf("cardM=%d, cardA=%d, p=%s, pprime=%s\n", cardM, cardA, p, pprime);
//#endif

   for (i=0; i<cardM; i++) pprime[i] -= offset;

   do {
#ifdef PRINT
#ifdef BI
     printv1v2(M);
#else
     printv1v2v3(M);
#endif
#endif
      if(!successor(M, cardM)) break;
   }  while (M && memcmp(M, pprime, cardM));
#ifdef PRINT
#  ifdef BI
     printv1v2(pprime);
#  else
     printv1v2v3(pprime);
#  endif
#endif
   exit(1);
}
/* END OF FILE PERM.W */
