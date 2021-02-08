/* File : Rectangle.i */

/* ------ PREAMBLE ------ */

/* Define name of the module */
%module Rectangle
%{
/* Put headers and other declarations here.
   They will be inserted into the 'header section'
   of the wrapper file*/
#define SWIG_FILE_WITH_INIT
#include "Rectangle.h"
%}

/* ----- DECLARATIONS ----- */

%include "typemaps.i"
%include "numpy.i"


%init %{
    import_array();
%}

/* Put typemaps and other Instructions here. */

// Modify functions with arguments width and height,
// to return these values. They are then not needed
// as input parameters any more.
%apply int *OUTPUT {int *width, int *height};

// Modifies all methods with argument  *corner and N,
// such that corner is returned as a numpy array.
// N as length of the array still has to be supplied.
%apply (int DIM1, int* ARGOUT_ARRAY1){(int N, int* corners)};

/* Let's just grab the original header file here. */
%include "Rectangle.h"

/* Instead of including the complete header file, one can
   also just name a few. Everything else is then
   excluded from being wrapped:
class Rectangle {
 public:
  Rectangle();
  ~Rectangle();
  int getArea();
};
*/


