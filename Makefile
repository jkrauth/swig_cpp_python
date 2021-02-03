TARGET		= Rectangle
CXX 		= g++
SWIG 		= swig
SWIGOPT 	=
SRCS 		= $(TARGET).cpp

CFLAGS 		=
INTERFACE 	= $(TARGET).i
INCLUDES 	= $(TARGET).h
PYTHON_INCLUDE	= -I/home/julian/anaconda3/include/python3.7m
CXXSHARED	= g++ -Wl,-G -shared

OBJS      	= $(SRCS:.c=.o)

IWRAP		= $(INTERFACE:.i=_wrap.i)
ISRCS		= $(IWRAP:.i=.cxx)
IOBJS		= $(IWRAP:.i=.o)

PYTHON_SO	= .so

# Using python setup file for compilation.
python: $(SRCS)
	$(SWIG) -c++ -python $(SWIGOPT) $(INTERFACE)
	python setup.py build_ext --inplace

# Alternatively doing this manually
gcc: $(SRCS)
	$(SWIG) -c++ -python $(SWIGOPT) $(INTERFACE)
	$(CXX) -c -fpic $(CFLAGS) $(ISRCS) $(SRCS) $(PYTHON_INCLUDE)
	$(CXXSHARED) $(OBJS) $(IOBJS) -o _$(TARGET)$(PYTHON_SO)

clean:
	$(RM) -r *_wrap.* *.o *.so __pycache__ build _$(TARGET).* $(TARGET).py $(TARGET).h.gch
