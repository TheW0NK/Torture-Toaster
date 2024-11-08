# Define directories
SUBDIRS = ini noarg c h m

# Define source files for each type
INI_FILES = $(wildcard ini/*.ini)
NOARG_BAT_FILES = $(wildcard noarg/*.bat)
C_FILES = $(wildcard c/*.ps1)
H_FILES = $(wildcard h/*.ps1)
M_FILES = $(wildcard m/*.ps1)

# Define the output executable
OUTPUT = torture_toaster.exe

# Build target
all: $(OUTPUT)

$(OUTPUT): $(C_FILES) $(H_FILES) $(M_FILES)
    # Commands to compile PowerShell files using ps2exe
    @echo "Compiling PowerShell files..."
    ps2exe -output $@ $(C_FILES) $(H_FILES) $(M_FILES)

# Clean target
clean:
    rm -f $(OUTPUT)
