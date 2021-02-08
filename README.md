### Small Python wrapper for a C++ class

SWIG is a software tool, that can be used to integrate C and C++ code into several high-level programming languages like Perl, Ruby, Python, Java, C#, ... Here, I'll show a simple example of how to use [SWIG-4](http://www.swig.org/Doc4.0/SWIGDocumentation.html) to wrap a small C++ class into Python.

The example includes two methods with values passed by reference and shows how they can be handled in the interface file, such that the functions return those values in Python.

The C++ files of this example are
* Rectangle.cpp
* Rectangle.h

Furthermore, we need the SWIG interface file

* Rectangle.i

and the python setup file

* setup.py

### Usage

In order to create the Python module do

```
$ swig -c++ -python Rectangle.i
$ python setup.py build_ext --inplace
```

or use the Makefile. This creates a `Rectangle.py` file that can be simply imported by Python.