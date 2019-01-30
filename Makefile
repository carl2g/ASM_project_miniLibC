ASM 	= 	nasm -f elf64

RM 		= 	rm -rf

SRCS 	=	strlen.asm 		\
			strcmp.asm 		\
			memset.asm 		\
			memcpy.asm 		\
			memmove.asm 	\
			strncmp.asm 	\
			strcasecmp.asm 	\
			strstr.asm 		\
			strpbrk.asm 	\
			strcspn.asm 	\
			rindex.asm 		\
			strchr.asm 		\
			write.asm 		\
			strcat.asm 		\
			strncat.asm

NAME 	=	libasm.so

OBJS 	= 	$(SRCS:.asm=.o)

LDFLAGS	= 	-shared -fPIC

LD 		= 	ld

all: 		$(NAME)

$(NAME): 	$(OBJS)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	$(ASM) -o $@ $<

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all clean

.PHONY: all clean fclean re