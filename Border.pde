
class Border 
{
  float x, y;
  float w, h;
  Border(float x_, float y_, float w_, float h_) 
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  void display() 
  {
    noStroke();
    fill(0, 200, 255, 70);
    rect(x, y, w, h);
  }
}