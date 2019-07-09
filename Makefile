all:	data2lily perm

data2lily:	data2lily3new.c
		gcc -O3 -o data2lily data2lily3new.c -lm

perm:	perm.w
	ctangle perm.w
	gcc -O3 -DPRINT -DTRI -o perm perm.c -lm

run:
	permusic.sh
