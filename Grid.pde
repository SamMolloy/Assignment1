class Grid 
{
  //deacling the variables to be used in drawing the grid
  float x1, y1, x2, y2;

  
  Grid(float x1_, float y1_, float x2_, float y2_) 
  {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
  }

  void display() 
  {
    noStroke();
    fill(0, 255, 255);
    line(x1, y1, x2, y2);
  }
}