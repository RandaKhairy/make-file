vpath %.c ./src
vpath %.h ./inc

CC = gcc
SRC_PATH = ./src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./inc/
path = ./dependencies/

OBJ = main.o LCD.o DIO.o
DEP = main.d LCD.d DIO.d
CLEAN_TARGET = $(LINK_TARGET) $(OBJ)

-include $(DEP)
all:$(LINK_TARGET)
	echo Bulding done !
clean:
	-rm $(CLEAN_TARGET)
	echo Cleaning done !

$(LINK_TARGET): $(OBJ) quiz.o
	$(CC) $(OBJ) quiz.o -o $@
	echo Linking done !

%.d : %.c
	$(CC) -M -I$(INCLUDE_PATH) $^ -o $@
	
%.o : %.c
	$(CC) -c -I$(INCLUDE_PATH) $< -o $@

