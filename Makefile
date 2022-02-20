##
## EPITECH PROJECT, 2021
## makefile
## File description:
## makefile
##

NAME	=	groundhog

all:	$(NAME)

$(NAME):
	cp groundhog.rb $(NAME)
	chmod 755 $(NAME)
clean:
	rm -f $(NAME)

fclean:	clean

re:	fclean all

.PHONY:	fclean all clean re

tests_ground:	$(TEST)
	make re
	./tests/test1.sh

clean_ground:
	rm test1
	rm test2
	rm test2_5
	rm test3
	rm test4_10
	rm test4_5
	rm test5
	rm test5_5
	rm test6
	rm test6_5
