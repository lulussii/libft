NAME = libft.a
CC = cc
CFLAGS = -Wall -Werror -Wextra
SRCS = ft_atoi.c\
	ft_isalnum.c\
	ft_isalpha.c\
	ft_isascii.c\
	ft_isdigit.c\
	ft_isprint.c\
	ft_putchar_fd.c\
	ft_putendl_fd.c\
	ft_putnbr_fd.c\
	ft_putstr_fd.c\
	ft_strchr.c\
	ft_strdup.c\
	ft_strlcat.c\
	ft_strlcpy.c\
	ft_strlcpy.c\
	ft_strlen.c\
	ft_strncmp.c\
	ft_strnstr.c\
	ft_strrchr.c\
	ft_tolower.c\
	ft_toupper.c\
	ft_bzero.c\
	ft_memset.c\
	ft_memcpy.c\
	ft_memcmp.c\
	ft_memmove.c\
	ft_memchr.c\
	ft_calloc.c\
	ft_strjoin.c\
	ft_substr.c\
	ft_itoa.c\
	ft_strtrim.c\
	ft_strmapi.c\
	ft_striteri.c\
	ft_split.c\

SRCS_BONUS = ft_lstnew_bonus.c\
		ft_lstdelone_bonus.c\
		ft_lstadd_front_bonus.c\
		ft_lstclear_bonus.c\
		ft_lstiter_bonus.c\
		ft_lstadd_back_bonus.c\
		ft_lstlast_bonus.c\
		ft_lstsize_bonus.c\
		ft_lstmap_bonus.c\

SRCS_GNL =	get_next_line/get_next_line.c\
			get_next_line/get_next_line_bonus.c\
			get_next_line/get_next_line_utils.c\
			get_next_line/get_next_line_utils_bonus.c

OBJDIR = objs
OBJ = $(SRCS:.c=$(OBJDIR)/%.o)
OBJ_BONUS = $(SRCS_BONUS:.c=$(OBJDIR)/%.o)
OBJ_GNL = $(SRCS_GNL:.c=$(OBJDIR)/%.o)

$(OBJDIR)/%.o: %.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

all: $(NAME)

$(NAME): $(OBJ) $(OBJ_GNL) libft.h get_next_line/get_next_line.h Makefile
	ar rcs $(NAME) $(OBJ) $(OBJ_GNL)

bonus : .bonus

.bonus: $(OBJ) $(OBJ_BONUS) $(OBJ_GNL) libft.h gnl/get_next_line.h
	ar rcs $(NAME) $(OBJ) $(OBJ_BONUS) $(OBJ_GNL)
	touch .bonus

clean:
	rm -rf $(OBJDIR)

fclean:	clean
	rm -f $(NAME)

re:	fclean all

.PHONY:	all clean fclean re bonus
