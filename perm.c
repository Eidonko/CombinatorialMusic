#define MAIN1 main1
#define MAIN2 main2
#define MAIN3 main \

#define EOP NULL
#define MAX_MULTISET_CARD 100
#define MAX_ALPHABET_CARD 10
#define Left v \

/*1:*/
#line 38 "perm.w"


/*2:*/
#line 59 "perm.w"


#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
#include <math.h> 
#include <assert.h> 

/*:2*/
#line 40 "perm.w"

/*3:*/
#line 74 "perm.w"

char M[MAX_MULTISET_CARD];
int cardM;
unsigned char*overlinedR;
int cardA;

int offset;
void printv(char*);
void printv1v2(char*);
void printv1v2v3(char*);
void printv1v2v3v4(char*);
void err(char*);



/*:3*/
#line 41 "perm.w"

/*4:*/
#line 107 "perm.w"

char*successor(char*v,int len)
{
char*pl,*pr;
int i,j,k;

pl= &v[len-2],pr= &v[len-1];
bzero((char*)overlinedR,cardA);

/*5:*/
#line 143 "perm.w"

while(pr!=Left)
{
overlinedR[*pr]++;



if(*pl<*pr)break;
pr= pl--;



}



/*:5*/
#line 116 "perm.w"



if(pr==Left)
return EOP;


overlinedR[*pl]++;

/*6:*/
#line 163 "perm.w"

for(k= *pl+1;k<cardM;k++)
if(overlinedR[k])break;



/*:6*/
#line 125 "perm.w"


overlinedR[k]--;
*pl++= k;

/*7:*/
#line 174 "perm.w"

for(i= 0;i<cardA;i++)
for(j= 0;j<overlinedR[i];j++)
*pl++= i;


/*:7*/
#line 130 "perm.w"


return v;
}





/*:4*/
#line 42 "perm.w"

/*9:*/
#line 265 "perm.w"

initialize(char*s,int*sl,int*cl,int*offset)
{
int min,max;
int i;
char*p= s;
char c;

*sl= strlen(s);

min= 255,max= 0;
while(c= *p++)
{
if(c<min)min= c;
if(c> max)max= c;
}

*offset= min;

*cl= max-min+1;

overlinedR= (unsigned char*)malloc(*cl);


for(i= 0;i<*sl;i++)
s[i]-= min;
}

/*:9*/
#line 43 "perm.w"

/*11:*/
#line 312 "perm.w"

#ifndef LINDA
MAIN1(int argc,char*argv[])
{
int i;

if(argc!=2)err("arguments");

strcpy(M,argv[1]);

initialize(M,&cardM,&cardA,&offset);

do{
#ifdef BI
printv1v2(M);
#else
printv1v2v3(M);
#endif
}while(successor(M,cardM));
}
#endif


/*:11*/
#line 44 "perm.w"

/*12:*/
#line 342 "perm.w"

#ifdef LINDA

struct strobj{char s[30],sprime[30];};
typedef struct strobj obj;

MAIN2(int argc,char*argv[])
{
int i,status;
obj o;
int compute(obj);

for(i= 1;i<argc-1;i++){
strcpy(o.s,argv[i]);
strcpy(o.sprime,argv[i+1]);
eval(compute(o));
}

for(i= 1;i<argc-1;i++)
in(?status);
}

int compute(obj o)
{
char*p= o.s;
char*pprime= o.sprime;

strcpy(M,p);
initialize(M,&cardM,&cardA,&offset);
do{
;
#ifdef BI
printv1v2(M);
#else
printv1v2v3(M);
#endif

p= successor(M,cardM);
}while(strcmp(p,pprime)!=0);
}
#endif  



/*:12*/
#line 45 "perm.w"

/*13:*/
#line 388 "perm.w"


struct strobj{char s[30],sprime[30];};
typedef struct strobj obj;

MAIN3(int argc,char*argv[])
{
int i,status,f= 0;
obj o;
int compute(obj);

if(argc<2)err("args");

if(argc==2){strcpy(o.s,argv[1]);

strcpy(o.sprime,argv[1]);
compute(o);
}else{
for(i= 1;i<argc-1;i++){
f= fork();

switch(f){
case-1:err("fork failed!");
exit(-1);

case 0:
fprintf(stderr,"fork %d running\n",i);
fflush(stderr);
strcpy(o.s,argv[i]);
strcpy(o.sprime,argv[i+1]);
compute(o);
fprintf(stderr,"child %d dies\n",i);
exit(i);
fflush(stderr);
return;

default:
printf("process %d (pid=%d) started.\n",i,f);
break;
}
}

fflush(stderr);
for(i= 1;i<argc-1;i++)
{int x;
printf("waiting process %d...\n",i);
x= wait();
printf("%d(%d) is done.\n",i,x);
}
}

return;
}

int compute(obj o)
{
char*p= o.s;
char*pprime= o.sprime;
int i;

strcpy(M,p);
initialize(M,&cardM,&cardA,&offset);




for(i= 0;i<cardM;i++)pprime[i]-= offset;

do{
#ifdef PRINT
#ifdef BI
printv1v2(M);
#else
printv1v2v3(M);
#endif
#endif
if(!successor(M,cardM))break;
}while(M&&memcmp(M,pprime,cardM));
#ifdef PRINT
#  ifdef BI
printv1v2(pprime);
#  else
printv1v2v3(pprime);
#  endif
#endif
exit(1);
}
/*:13*/
#line 46 "perm.w"




/*:1*//*8:*/
#line 181 "perm.w"

void printv(char*v){
int i;
long l;
static long old_l;
static FILE*f;
static int num;

if(f==NULL)f= fopen("istogramma","w");
if(f==NULL)err("can't open istogramma");

++num;
#define QUANTUM 1871100
if(num%QUANTUM==0||num%QUANTUM==1)
printf("%d\t",num);

for(l= 0L,i= 0;i<cardM;i++){
l= l*cardA+v[i];
if(num%QUANTUM==0||num%QUANTUM==1)
putchar(v[i]+offset);
}
if(num%QUANTUM==0||num%QUANTUM==1)
putchar('\n');







if(old_l)
fprintf(f,"%f\n",log(l-old_l));
old_l= l;

}

int ptoa(char*p,int l,int base)
{
int i,res;

for(res= i= 0;i<l;i++)
res= res*base+p[i];
return res;
}

void printv1v2(char*v){
int l;
l= cardM;

assert(l%2==0);
l>>= 1;
printf("%d, %d\n",ptoa(v,l,cardA),ptoa(v+l,l,cardA));
}

void printv1v2v3(char*v){
int l;
l= cardM;

assert(l%3==0);
l/= 3;
printf("%d, %d, %d\n",
ptoa(v,l,cardA),ptoa(v+l,l,cardA),ptoa(v+l+l,l,cardA));
}

void printv1v2v3v4(char*v){
int l;
l= cardM;

assert(l%4==0);
l/= 4;
printf("%d, %d, %d, %d\n",
ptoa(v,l,cardA),ptoa(v+l,l,cardA),ptoa(v+l+l,l,cardA),ptoa(v+3*l,l,cardA));
}

void dump(char*overlinedR){int i;
printf("overlinedR=");
for(i= 0;i<cardM;i++)
printf("%1d",overlinedR[i]);
printf("\n");
}

/*:8*//*10:*/
#line 294 "perm.w"

void err(char*s)
{
fprintf(stderr,"condizione di errore: \"%s\" - stop.\n",s);
exit(-1);
}




/*:10*/
