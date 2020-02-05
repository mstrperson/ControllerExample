Controller controller;

void setup()
{
  controller = new Controller(this);
}

void draw()
{
  controller.updateButtonState();
  controller.test();
  
  print("button 9: ");
  println(controller.buttonState[9]);
}
