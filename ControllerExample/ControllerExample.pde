PlayStationController controller;

int x = width / 2, y=height / 2;


void setup()
{
  size(500, 500);
  controller = new PlayStationController(this);
}

void draw()
{
  background(255,255,255);
  controller.updateButtonState();
  
  fill(180, 50, 255);
  noStroke();
  ellipse(x, y, 20, 20);
  /*
  if(controller.left()) x -= 5;
  if(controller.right()) x += 5;
  if(controller.up()) y -= 5;
  if(controller.down()) y += 5;
  */
  
  x += 5*controller.Lx();
  y += 5*controller.Ly();
}
