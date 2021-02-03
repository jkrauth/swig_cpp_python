### Small Python wrapper for a C++ class

We use [SWIG](http://www.swig.org/Doc3.0/SWIGDocumentation.html#SWIG_output) to wrap a small C++ class into Python. The class is an example taken from [here](https://cython.readthedocs.io/en/latest/src/userguide/wrapping_CPlusPlus.html).

The necessary files of this example are the C++ file with its header
* Rectangle.cpp
* Rectangle.h,

the SWIG interface file

* Rectangle.i

and the python setup file

* setup.py

In order to create the Python module do

```
$ swig -c++ -python Rectangle.i
$ python setup.py build_ext --inplace
```

or use the Makefile.