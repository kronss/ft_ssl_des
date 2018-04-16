
CC = gcc

CFLAGS = -I./$(INC_DIR) -I./$(LIB_HDR) -Wall -Wextra -Werror

################################################################################
#	
################################################################################
NAME = ft_ssl


################################################################################
#           INCLUDE
INC_NAME =	main_ssl.h
#            <---------- add header file      

INC_DIR =	inc
INC = $(addprefix $(INC_DIR)/, $(INC_NAME))

################################################################################
#          OBJECT
OBJ_DIR =	.obj
OBJ = $(subst .c,.o,$(subst $(SRC_DIR)/,$(OBJ_DIR)/,$(SRC)))


################################################################################
#          SOURCE
SRC_DIR =	src
SRC = $(addprefix $(SRC_DIR)/, $(SRC_NAME))
SRC_NAME =	main_ssl.c     \
            
#                               <---------- add .c file   


################################################################################
#	LIBFT
################################################################################
LIB_DIR = libft
LIB = $(LIB_DIR)/libft.a
LIB_HDR = $(LIB_DIR)/inc/

$(LIB):
	@make -C $(LIB_DIR)

################################################################################
#	RULES
################################################################################

.PHONY: all clean fclean re t

all: $(LIB) $(NAME) 

$(NAME): $(OBJ) $(INC)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	@echo "\033[33m'$(NAME)' compiling done.\033[0m"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) -I./$(INC_DIR) -c $(CFLAGS) $? -o $@

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all


##################################################################################
# dell 

lite_clean:
	rm -rf $(OBJ_DIR)

rew: lite_clean $(NAME);
	
r:	$(NAME)
	./$(NAME)

bug:
	$(CC) $(CFLAGS) $(SRC) -g -o bug

debug: bug
	lldb -- ./bug