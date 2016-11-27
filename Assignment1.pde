PImage bg1;//declare image variable for background image
Border b1, b2, b3, b4;// making 4 border objects


void setup() 
{
  size(1024, 576);//setting the size to the size of the background image
  bg1 = loadImage("mars_BG.jpg");//loading the image
  
  //filling in the borders
  b1 = new Border(0, 0, 1024, 50);
  b2 = new Border(0, 50, 50, 575);
  b3 = new Border(50, 526, 974, 50);
  b4 = new Border(974, 526, 50, -476);
}

void draw() 
{
  background(bg1);//setting the image as the background
  
  //displaying all the borders
  b1.display();
  b2.display();
  b3.display();
  b4.display();
}