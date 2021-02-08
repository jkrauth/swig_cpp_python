TARGET		= Rectangle
SWIG 		= swig
SWIGOPT 	=
SRCS 		= $(TARGET).cpp

CFLAGS 		=
INTERFACE 	= $(TARGET).i
INCLUDES 	= $(TARGET).h
PYTHON_INCLUDE	= -I/home/julian/anaconda3/include/python3.7m

OBJS      	= $(SRCS:.c=.o)

IWRAP		= $(INTERFACE:.i=_wrap.i)
ISRCS		= $(IWRAP:.i=.cxx)
IOBJS		= $(IWRAP:.i=.o)

PYTHON_SO	= .so

# Using python setup file for compilation.
python: $(SRCS) numpy.i
	$(SWIG) -c++ -python $(SWIGOPT) $(INTERFACE)
	python setup.py build_ext --inplace

# Alternatively doing this manually
gcc: $(SRCS) numpy.i
	$(SWIG) -c++ -python $(SWIGOPT) $(INTERFACE)
	$(CXX) -c -fpic $(CFLAGS) $(ISRCS) $(SRCS) $(PYTHON_INCLUDE)
	$(CXX) -Wl,-G -shared $(OBJS) $(IOBJS) -o _$(TARGET)$(PYTHON_SO)

numpy.i:
	wget https://raw.githubusercontent.com/numpy/numpy/master/tools/swig/numpy.i

clean:
	$(RM) -r *_wrap.* *.o *.so __pycache__ build _$(TARGET).* $(TARGET).py $(TARGET).h.gch
