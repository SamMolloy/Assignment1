PImage[] background = new PImage[2];//creating an array of images for the background
Border[] Border = new Border[4];// making 4 border objects
float health = random(1, 100);//Random variable to set as the health
float oxygen = random(1, 100);//random variable for the oxygen level

void setup() 
{
  size(1024, 576);//setting the size to the size of the background image
  
  //for loop to load the images into the array
  for(int i = 0; i < background.length; i++)
  {
    background[i] = loadImage("BG"+i+".jpg");
  }
  
  //filling in the borders
  Border[0] = new Border(0, 0, 1024, 50);
  Border[1] = new Border(0, 50, 50, 575);
  Border[2] = new Border(50, 526, 974, 50);
  Border[3] = new Border(974, 526, 50, -476);
}

void draw() 
{
  background(background[0]);//setting background image
  
  //for loop to display the borders
  for(int i = 0; i<Border.length; i++)
  {
    Border[i].display();
  }

  Health();
  Crosshair();
  Oxygen();
}

void Health()
{
  int i = int(health);
  
  //series of if, elseif and else statements to change the colour of the health depending on hwo much health you have
  if(health > 67)
  {
  fill(0, 255, 255);
  }
  else if(health < 67 && health > 33)
  {
    fill(255, 165, 0);
  }
  else
  {
    fill (255, 0, 0);
  }
  
  textSize(25);
  text("Health:", 70, 560);
  text(i, 155, 560);
  
}

void Oxygen()
{
  int i = int(oxygen);
  
  //series of if, elseif and else statements to change the colour of the health depending on hwo much health you have
  if(oxygen > 67)
  {
  fill(0, 255, 255);
  }
  else if(oxygen < 67 && oxygen > 33)
  {
    fill(255, 165, 0);
  }
  else
  {
    fill (255, 0, 0);
  }
  
  textSize(25);
  text("Oxygen Level:", 230, 560);
  text(i, 400, 560);
}



void Crosshair()
{
  stroke(255,0,0);
  fill(255,0,0,50);
  ellipse(mouseX, mouseY, 25, 25);
}