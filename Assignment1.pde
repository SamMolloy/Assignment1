PImage[] background = new PImage[2];//creating an array of images for the background
Border b1, b2, b3, b4;// making 4 border objects


void setup() 
{
  size(1024, 576);//setting the size to the size of the background image
  
  //for loop to load the images into the array
  for(int i = 0; i < background.length; i++)
  {
    background[i] = loadImage("BG"+i+".jpg");
  }
  
  //filling in the borders
  b1 = new Border(0, 0, 1024, 50);
  b2 = new Border(0, 50, 50, 575);
  b3 = new Border(50, 526, 974, 50);
  b4 = new Border(974, 526, 50, -476);
}

void draw() 
{
  background(background[0]);//setting background image
  
  //displaying all the borders
  b1.display();
  b2.display();
  b3.display();
  b4.display();
}