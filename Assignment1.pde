PImage bg1;
Border b1, b2, b3, b4;
void setup() 
{
  size(1024, 576);
  bg1 = loadImage("mars_BG.jpg");
   b1 = new Border(0, 0, 1024, 50);
  b2 = new Border(0, 50, 50, 575);
  b3 = new Border(50, 526, 974, 50);
  b4 = new Border(974, 526, 50, -476);
}

void draw() 
{
  background(bg1);
  b1.display();
  b2.display();
  b3.display();
  b4.display();
}