# Makefile for CS 2150 Hunter Vaccaro (hpv8hf) 11/5/2019 
# This Makefile shows how to link assembly with C/C++

# Defines the C++ compiler we'll be using
CXX	= clang++ -m64

# Defines the flags we'll be passing to the C++ compiler
CXXFLAGS	= -Wall -g

# Defines the assembler
AS	= nasm

# Defines the flags for the assembler
ASFLAGS	= -f elf64 -g

# All of the .o files for our program
OFILES	= threexplusone.o threexinput.o	timer.o

# This tells make to create a .o file from a .cpp file, using the
# defaults above (i.e. the CXX and CXXFLAGS macros)
.SUFFIXES: .o .cpp

# This tells make to create a .o file from a .s file, using the
# defaults above (i.e. the AS and ASFLAGS macros)
.SUFFIXES: .o .s

# How to compile our final program.  Note that we do NOT specify an
# output executable name -- in order for this to work with the grading
# system, the file needs to be a.out (a.exe in Cygwin).
threexplusonemain:	$(OFILES)
	$(CXX) $(CXXFLAGS) $(OFILES)

# This will clean up (remove) all our object files.  The -f option
# tells rm to forcily remove the files (i.e. don't ask if they should
# be removed or not).  This removes object files (*.o) and Emacs
# backup files (*~)
clean:
	/bin/rm -f *.o *~ threexplusone.exe

# We don't have any dependencies for this small program
