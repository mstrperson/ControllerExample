
float x = width / 2, y=height / 2;


void setup()
{
  initializeControllers();
  size(500, 500);
}

void draw()
{
  background(255,255,255);
  
  fill(180, 50, 255);
  noStroke();
  ellipse(x, y, 20, 20);
  
  
  if(Player1.left()) x -= 5;
  if(Player1.right()) x += 5;
  if(Player1.up()) y -= 5;
  if(Player1.down()) y += 5;
  
  if(Player1.buttonState[0])
  {
    textSize(50);
    text("Woah!!!", 50, 100);
  }
  
  
  // if you have a PlayStation Controller... use the Analog Sticks!
  //x += 5*controller.Lx();
  //y += 5*controller.Ly();
  
  //if(controller.Triangle())
  //{
  //  textSize(50);
  //  text("Woah!!!", 50, 100);
  //}
 
}
