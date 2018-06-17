all:	data2lily perm

data2lily:	data2lily3new.c
		gcc -O3 -o data2lily data2lily3new.c

perm:	perm.w
	ctangle perm.w
	gcc -O3 -DPRINT -DTRI -o perm perm.c

run:
	permusic.sh
