
float x = width / 2, y=height / 2;

float dx = 5, dy = 5;

int level = 1;

void setup()
{
  // do all the annoying initialization
  initializeControllers();
  size(500, 500);
}

void draw()
{
  background(255,255,255);
  
  control();
  if(level == 1)
  {
    drawLevel1();
  }
  else if(level == 2)
  {
    drawLevel2();
  }
  
  checkCollision();
  checkWin();
  
  drawPlayer();
}

void checkWin()
{
  
}

void checkCollision()
{
  
}

void drawLevel1()
{
}


void drawLevel2()
{
  
}

void drawPlayer()
{
  fill(180, 50, 255);
  noStroke();
  ellipse(x, y, 20, 20);
}

void control()
{
  // Use Player1 or Player2 if you have a second controller plugged in!
  if(Player1.left()) x -= dx;
  if(Player1.right()) x += dx;
  if(Player1.up()) y -= dy;
  if(Player1.down()) y += dy;
  
  if(Player1.buttonState[0])
  {
    textSize(50);
    text("Woah!!!", 50, 100);
  } 
}
