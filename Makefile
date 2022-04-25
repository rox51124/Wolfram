##
## EPITECH PROJECT, 2022
## B-FUN-400-TLS-4-1-wolfram-roxane.baert
## File description:
## Makefile
##

NAME	= 	wolfram

all:
	stack build
	cp $(shell stack path --local-install-root)/bin/$(NAME) .

clean:
	stack clean

fclean:	clean
	rm -rf $(NAME)

re:	fclean all

.PHONY: all clean fclean re