import org.gamecontrolplus.*;
import java.util.List;
import java.util.ArrayList;

// Globally Defined function usable in the main class.
ArrayList<Controller> getControllers()
{
  ArrayList<Controller> controllers = new ArrayList<Controller>();
  ControlIO input = ControlIO.getInstance(this);
  for(ControlDevice device : input.getDevices())
  {
    String name = device.getName();
    if(name.contains("joystick"))
    {
      controllers.add(new Controller(device));
    }
  }
  
  return controllers;
}
ArrayList<Controller> Controllers = getControllers();

class Controller
{
  private ControlIO input;
  private ControlDevice control1;
  
  public boolean[] buttonState;
  
  
  
  public Controller(PApplet app)
  {
    input = ControlIO.getInstance(app);
    println(input.getDevices());
    
    control1 = input.getDevice(3);
    println(input.devicesToText("control1"));
    
    buttonState = new boolean[control1.getNumberOfButtons()];
    updateButtonState();
  }
  
  public Controller(PApplet app, int number)
  {
    input = ControlIO.getInstance(app);
    println(input.getDevices());
    
    control1 = input.getDevice(number);
    println(input.devicesToText("control1"));
    
    buttonState = new boolean[control1.getNumberOfButtons()];
    updateButtonState();
  }
  
  public Controller(ControlDevice device)
  {
    control1 = device;
    updateButtonState();
  }
  
  
  
  void test()
  {
    for(int i=0; i<control1.getNumberOfButtons(); i++)
    {
      print(int(control1.getButton(i).pressed()));
    } 
    
    println();
    
    print( int(control1.getSlider("x").getValue()),int(control1.getSlider("y").getValue()) );
    
    println();
  }
  
  public void updateButtonState()
  {
    for(int i = 0; i < control1.getNumberOfButtons(); i++)
      buttonState[i] = control1.getButton(i).pressed();
    delay(20);
  }
  
  
  public float getXAxis()
  {
    try
    {
      return control1.getSlider("x").getValue();
    }
    catch(Exception e)
    {
      println(e.getMessage());
      return 0;
    }
  }
  
  public float getYAxis()
  {
    return control1.getSlider("y").getValue();
  }
}
