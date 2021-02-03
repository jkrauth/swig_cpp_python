from distutils.core import setup, Extension 
#name of module 
name  = "Rectangle"
  
#version of module 
version = "1.0"
  
# specify the name of the extension and source files 
# required to compile this 
ext_modules = Extension(
    name='_Rectangle',
    sources=["Rectangle.i","Rectangle.cpp"],
    swig_opts=["-c++","-I."]) 
  
setup(name=name, 
      version=version, 
      ext_modules=[ext_modules]) 
