# Define the compiler
CC = gcc

# Define directories
SUBDIRS = ini noarg.bat c h m

# Define source files
SRC_FILES = $(wildcard $(addsuffix /*.c, $(SUBDIRS)))

# Define the output executable
OUTPUT = torture_toaster

# Build target
all: $(OUTPUT)

$(OUTPUT): $(SRC_FILES)
    $(CC) -o $@ $^

# Clean target
clean:
    rm -f $(OUTPUT)
