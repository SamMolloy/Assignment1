PFont font;//creating variable for custom font
PImage[] background = new PImage[2];//creating an array of images for the background
Border[] Border = new Border[3];// making 4 border objects
Clock clock;//making a clock object to put in the hud
Button button;// creates the button to enter the map
Button button2;// creates the button to exit the map

float health = random(1, 100);//Random variable to set as the health
float oxygen = random(1, 100);//random variable for the oxygen level
float armour = random(1, 100);//random variable for the armour
float buttonpressed = 0;//conditional varibale used for the button
ArrayList<Grid> grid;
float gridx = 50;//Used for drawing the grid
float gridy = 50;
float playerx = random(50, 924);//used for drawing the player marker
float playery = random(50, 526);
float objectivex = random(50, 924);//used for drawing the objective marker
float objectivey = random(50, 546);



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
  button2 = new Button("EXIT", 850, 530, 100, 45);
  
  grid = new ArrayList<Grid>();
  //adding the vertical gridlines to the arraylist
  for(int i=0; i<11; i++)
  {
    grid.add(new Grid(gridx, 50, gridx, 526));
    gridx = gridx + 92.4;
  }
  
  //adding the horizontal gridlines to the arraylist
  for(int i = 0; i<7; i++)
  {
    grid.add(new Grid(50, gridy, 974, gridy));
    gridy = gridy + 79.3;
  }
}//end setup

//Variables for the radar
float speed = 0.01;
int trailLength = 50;  
float theta = 0;
float centre_x, centre_y;
color c = color(255, 140, 0);
float radius = 75;

void draw() 
{
  background(background[0]);//setting background image
 
  //for loop to display the borders
  for(int i = 0; i<Border.length; i++)
  {
    Border[i].display();
  }

  //calling the methods to execute
  Health();
  Crosshair();
  Oxygen();
  Armour();
  
  //Displaying the radar
  stroke(0, 255, 0);
  noFill();
  ellipse(centre_x, centre_y, radius * 2, radius * 2);
  float intensityChange = 255.0f / trailLength;
  for(int i = 0 ; i < trailLength ; i ++)
  {
    float lineTheta = theta - (i * speed);
    stroke(0, 255 - (i * intensityChange), 0);
    float x = centre_x + sin(lineTheta) * radius;
    float y = centre_y - cos(lineTheta) * radius;
    line(centre_x, centre_y, x, y);
  }
  theta += speed;
  
  //setting the colour and displaying the clock
  fill(255, 140, 0);
  clock.getTime();
  clock.display();
  
  //draw the button
  if(button.MouseIsOver())
  {
    fill(255, 140, 0);
    rect(900,1,100,45);
  }
 
  button.Draw();
  
  //if the map button is pressed it will switch to a map of the section of mars you are in
  if(buttonpressed == 1)
  {
     background[1].resize(1024, 576);
     background(background[1]);
     Grid();
     if(button2.MouseIsOver())
      {
        stroke(0);
        fill(255, 140, 0);
        rect(850, 530, 100, 45);
      }
  
     button2.Draw();
  }
   
}

//Method to display health bar
void Health()
{
  int i = int(health);//turning the random float into an integer 
  fill(255, 140, 0);
  textSize(30);
  text("HP:", 70, 555);
  //series of if, elseif and else statements to change the colour of the health depending on hwo much health you have
  if(health > 67)
  {
  fill(0, 255, 0);
  }
  else if(health < 67 && health > 33)
  {
    fill(255, 140, 0);
  }
  else
  {
    fill (255, 0, 0);
  }
  text(i, 100, 555);
}

//Method to display ocygen level
void Oxygen()
{
  int i = int(oxygen);
  fill(255, 140, 0);
  textSize(30);
  text("O2:", 230, 555);
  //series of if, elseif and else statements to change the colour of the oxygen depending on how much you have left
  if(oxygen > 67)
  {
  fill(0, 255, 0);
  }
  else if(oxygen < 67 && oxygen > 33)
  {
    fill(255, 140, 0);
  }
  else
  {
    fill (255, 0, 0);
  }
  text(i+"%", 270, 555);
}

//Method to display Armour strength
void Armour()
{
  int i = int(armour);
  fill(255, 140, 0);
  textSize(30);
  text("ARMOUR:", 460, 555);
  //series of if, elseif and else statements to change the colour of the armour depending on how much armour you have remaining
  if(armour > 67)
  {
  fill(0, 255, 0);
  }
  else if(armour < 67 && armour > 33)
  {
    fill(255, 140, 0);
  }
  else
  {
    fill (255,0, 0);
  }
  text(i, 520, 555);
}

//method to draw a small crosshair
void Crosshair()
{
  stroke(255,0,0);
  fill(255,0,0,50);
  ellipse(mouseX, mouseY, 20, 20);
}//end crosshair

//Method to check if button has been pressed
void mousePressed()
{
  if(button.MouseIsOver())
  {
    buttonpressed=1;
  }
  if(button2.MouseIsOver())
  {
    buttonpressed=0;
  }
}//end mousePressed

void Grid()
{
  Border[1].display();  
  
    //for loop to display the grid lines
    for(Grid g : grid)
    {
      g.display();
    }
    
    //draws the player marker
    fill(0);
    stroke(255, 0, 0);
    ellipse(playerx, playery, 15, 15);
    ellipse(510, 555, 15, 15);
    
    //draws the objective marker
    stroke(0,0,255);
    rect(objectivex, objectivey, 15, 15);
    rect(290, 545, 15, 15);
    
    //creates the legend under the map
    fill(255, 140, 0);
    text("PLAYER:", 460, 555);
    text("OBJECTIVE:", 230, 555);
}