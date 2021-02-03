all:
	swig -c++ -python Rectangle.i
	python setup.py build_ext --inplace

clean:
	$(RM) -r *_wrap.c* __pycache__ build _Rectangle.* Rectangle.py
