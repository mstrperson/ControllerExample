
float x = width / 2, y=height / 2;


void setup()
{
  // do all the annoying initialization
  initializeControllers();
  size(500, 500);
}

void draw()
{
  background(255,255,255);
  
  fill(180, 50, 255);
  noStroke();
  ellipse(x, y, 20, 20);
  
  // Use Player1 or Player2 if you have a second controller plugged in!
  if(Player1.left()) x -= 5;
  if(Player1.right()) x += 5;
  if(Player1.up()) y -= 5;
  if(Player1.down()) y += 5;
  
  if(Player1.buttonState[0])
  {
    textSize(50);
    text("Woah!!!", 50, 100);
  } 
}
