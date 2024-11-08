# Define directories
SUBDIRS = ini noarg.bat c h m

# Define source files for each type
INI_FILES = $(wildcard ini/*.ini)
NOARG_BAT_FILES = $(wildcard noarg.bat/*.bat)
C_FILES = $(wildcard c/*.ps1)
H_FILES = $(wildcard h/*.ps1)
M_FILES = $(wildcard m/*.ps1)

# Define the output executable
OUTPUT = torture_toaster

# Build target
all: $(OUTPUT)

$(OUTPUT): $(INI_FILES) $(NOARG_BAT_FILES) $(C_FILES) $(H_FILES) $(M_FILES)
    # Commands to compile each type of file
    @echo "Compiling INI files..."
    # Add commands to handle INI files if needed

    @echo "Compiling BAT files..."
    # Add commands to handle BAT files if needed

    @echo "Compiling C files..."
    # Example for C files
    gcc -o $@ $(C_FILES)

    @echo "Compiling H files..."
    # Add commands to handle H files if needed

    @echo "Compiling M files..."
    # Add commands to handle M files if needed

# Clean target
clean:
    rm -f $(OUTPUT)
