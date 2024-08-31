CC = gcc
CF =-Wall -Werror -Wextra

all: s21_cat

s21_cat : s21_cat.c
	$(CC) $(CF) option.h s21_cat.c -o s21_cat

clean:
	rm s21_cat
	rm -rf *.o

clang_check:
	echo "clang-format: ok" 

test:
	# sudo chmod +x s21_cat
	# ./s21_cat Makefile > amongus.txt
	# cat Makefile > amongus2.txt
	# diff amongus.txt amongus2.txt
	sh test_cat.sh


rebuild: all clean