class Clock extends Time
{
  int fontSize;
  float x, y;
  
  Clock(int _fontSize, float _x, float _y) 
  {
    fontSize = _fontSize;
    x = _x;
    y = _y;
  }
  
  //gets the current time from the Time class
  void getTime() 
  {
    super.getTime();
  }
  
  //displays the clock
  void display() 
  {
    textSize(fontSize);
    textAlign(CENTER);
    text (hour + ":" + nf(minute, 2) + ":" + nf(second, 2), x, y);
  } 
}
  
  