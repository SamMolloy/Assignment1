class Button 
{
  String name;
  float x;
  float y;
  float w;  
  float h;
  
  Button(String name_, float x_, float y_, float w_, float h_) 
  {
    name = name_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  void Draw() 
  {
    noStroke();
<<<<<<< HEAD
    fill(255, 140, 0, 70);
=======
    fill(0, 255, 255, 70);
>>>>>>> origin/master
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(name, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() 
  {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) 
    {
      return true;
    }
    return false;
<<<<<<< HEAD
  }
=======
  }
}
>>>>>>> origin/master
