class Time 
{
  int hour, minute, second;
  Time() 
  {
  }
  
  //gets the current time
  void getTime() 
  {
    hour = hour();
    minute = minute();
    second = second();
  }
}