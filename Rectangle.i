/* File : Rectangle.i */

/* ------ PREAMBLE ------ */

/* Define name of the module */
%module Rectangle
%{
/* Put headers and other declarations here.
   They will be inserted into the 'header section'
   of the wrapper file*/
#include "Rectangle.h"
%}

/* ----- DECLARATIONS ----- */

/* Put typemaps and other Instructions here. */
%include "typemaps.i"
//%apply int *INPUT {int *bla};
%apply int *OUTPUT {int *width, int *height};
// Returns a pair (width, height)
void Rectangle::getSize(int *width, int *height);



/* Let's just grab the original header file here. */
%include "Rectangle.h"

/* Instead also a reduce version of the class can
   be listed, to exclude specific methods or attributes
   from being wrapped:
class Rectangle {
 public:
  Rectangle();
  ~Rectangle();
  int getArea();
};
*/


