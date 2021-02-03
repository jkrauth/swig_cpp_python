/* File : Rectangle.h */

class Rectangle {
private:
  int x0 = 0;
  int y0 = 0;
  int x1 = 1;
  int y1 = 1;  
public:
  Rectangle();
  Rectangle(int x0, int y0, int x1, int y1);
  ~Rectangle();
  int getArea();
  void getSize(int* width, int* height);
  void move(int dx, int dy);
};
