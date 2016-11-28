PFont font;
PImage[] background = new PImage[2];//creating an array of images for the background
Border[] Border = new Border[3];// making 4 border objects
Clock clock;//making a clock object to put in the hud
Button button;
float health = random(1, 100);//Random variable to set as the health
float oxygen = random(1, 100);//random variable for the oxygen level
float armour = random(1, 100);//random variable for the armour
float buttonpressed = 0;//conditional varibale used for the button
ArrayList<Grid> grid;//Array list used for the lines used to draw the map grid


void setup() 
{
  size(1024, 576);//setting the size to the size of the background image
  
  //loading my own font
  font = loadFont("agency.vlw");
  textFont(font);
  
  //co-ordinates for the centre of the radar
  centre_x = 85;
  centre_y = 85;
  
  //for loop to load the images into the array
  for(int i = 0; i < background.length; i++)
  {
    background[i] = loadImage("BG"+i+".jpg");
  }
  
  //filling in the borders
  Border[0] = new Border(0, 0, 1024, 50);
  Border[1] = new Border(0, 526, 1024, 50);
  Border[2] = new Border(0, 50, 170, 130);
 
  //placing the clock in the corner of the hud
  clock = new Clock (30, 950, 565);
  
  //Creating button object 
  button = new Button("MAP", 900, 1, 100, 45);
  
  grid = new ArrayList<Grid>();//
  
  

}

//Variables for the radar
float speed = 0.01;
int trailLength = 50;  
float theta = 0;
float centre_x, centre_y;
color c = color(0, 255, 255);
float radius = 75;

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
  Armour();
  
  //Displaying the radar
  stroke(0, 255, 255);
  noFill();
  ellipse(centre_x, centre_y, radius * 2, radius * 2);
  float intensityChange = 255.0f / trailLength;
  for(int i = 0 ; i < trailLength ; i ++)
  {
    float lineTheta = theta - (i * speed);
    stroke(0, 255 - (i * intensityChange), 255 - (i * intensityChange));
    float x = centre_x + sin(lineTheta) * radius;
    float y = centre_y - cos(lineTheta) * radius;
    line(centre_x, centre_y, x, y);
  }
  theta += speed;
  
  //setting the colour and displaying the clock
  fill(0, 255, 255);
  clock.getTime();
  clock.display();
  
  //draw the button
  if(button.MouseIsOver())
  {
    fill(0, 255, 255);
    rect(900,1,100,45);
  }
  button.Draw();
  
  if(buttonpressed == 1)
  {
    background[1].resize(1024, 576);
    background(background[1]);
    
  }
   
}

void Health()
{
  int i = int(health);//turning the random float into an integer 
  
  //series of if, elseif and else statements to change the colour of the health depending on hwo much health you have
  if(health > 67)
  {
  fill(0, 255, 0);
  }
  else if(health < 67 && health > 33)
  {
    fill(255, 165, 0);
  }
  else
  {
    fill (255, 0, 0);
  }
  
  textSize(30);
  text("HEALTH:", 70, 555);
  text(i, 118, 555);
  
  
  
  
}

void Oxygen()
{
  int i = int(oxygen);
  
  //series of if, elseif and else statements to change the colour of the oxygen depending on how much you have left
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
  
  textSize(30);
  text("OXYGEN LEVEL:", 230, 555);
  text(i+"%", 318, 555);
}

void Armour()
{
  int i = int(armour);
  
  //series of if, elseif and else statements to change the colour of the armour depending on how much armour you have remaining
  if(armour > 67)
  {
  fill(0, 255, 255);
  }
  else if(armour < 67 && armour > 33)
  {
    fill(255, 165, 0);
  }
  else
  {
    fill (255, 0, 0);
  }
  
  textSize(30);
  text("ARMOUR STRENGTH:", 460, 555);
  text(i, 558, 555);
}

void Crosshair()
{
  stroke(255,0,0);
  fill(255,0,0,50);
  ellipse(mouseX, mouseY, 20, 20);
}

void mousePressed()
{
  if(button.MouseIsOver())
  {
    buttonpressed=1;
  }
}