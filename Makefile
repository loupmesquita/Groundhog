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
