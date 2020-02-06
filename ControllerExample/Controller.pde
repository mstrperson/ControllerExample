import org.gamecontrolplus.*;
import java.util.List;
import java.util.ArrayList;

// Globally Defined functions usable in the main class.
ArrayList<SimpleController> getControllers()
{
  ArrayList<SimpleController> controllers = new ArrayList<SimpleController>();
  ControlIO input = ControlIO.getInstance(this);
  int i = 0;
  for(ControlDevice device : input.getDevices())
  {
    String name = device.getName();
    print("Device:  ");
    name = name.toLowerCase();
    println(name);
    if(name.contains("joystick") || name.contains("gamepad") || name.contains("controller"))
    {
      controllers.add(new SimpleController(this, i));
    }
    
    i++;
  }
  
  return controllers;
}

ArrayList<SimpleController> Controllers = getControllers();

// Player1 is the first controller detected
SimpleController Player1 = null;
// Player2 is the second controller detected if a second controller is plugged in.
SimpleController Player2 = null;

void initializeControllers()
{
  thread("update");
  print("Controllers:  ");
  println(Controllers.size());
  
  if(Controllers.size() > 0)
  {
    Player1 = Controllers.get(0);
    if(Controllers.size() > 1)
      Player2 = Controllers.get(1);
  }
}

void update()
{
  while(true)
  {
    if(Player1 != null) Player1.updateButtonState();
    if(Player2 != null) Player2.updateButtonState();
    delay(20);
  }
}


class Controller
{
  private String xAxisName;
  private String yAxisName;
  
  private ControlIO input;
  private ControlDevice control1;
  
  public boolean[] buttonState;
    
  public Controller(PApplet app, int number)
  {
    input = ControlIO.getInstance(app);
    println(input.getDevices());
    
    control1 = input.getDevice(number);
    println(input.devicesToText("control1"));
    
    for(ControlInput s : control1.getInputs())
    {
      if(s instanceof ControlSlider)
      {
        if(s.getName().toLowerCase().equals("x") || s.getName().toLowerCase().equals("x axis"))
        {
          xAxisName = s.getName();
        }
        if(s.getName().toLowerCase().equals("y") || s.getName().toLowerCase().equals("y axis"))
        {
          yAxisName = s.getName();
        }
      }
    }
    
    buttonState = new boolean[control1.getNumberOfButtons()];
    updateButtonState();
  }
  
  void test()
  {
    for(int i=0; i<control1.getNumberOfButtons(); i++)
    {
      print(int(control1.getButton(i).pressed()));
    } 
    
    println();
    
    print( int(control1.getSlider(xAxisName).getValue()),int(control1.getSlider(yAxisName).getValue()) );
    
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
    
    float v = control1.getSlider(xAxisName).getValue();
    
    if(abs(v) < 0.01) return 0;
    
    return v; 
  }
  
  public float getYAxis()
  {
    float v = control1.getSlider(yAxisName).getValue();
    
    if(abs(v) < 0.01) return 0;
    
    return v; 
  }
}

class SimpleController extends Controller
{ 
  public SimpleController(PApplet app, int n)
  {
    super(app, n);
  }
  
  public boolean X() { return buttonState[0]; }
  public boolean B() { return buttonState[1]; }
  public boolean A() { return buttonState[2]; }
  public boolean Y() { return buttonState[3]; }
  
  public boolean left() { return getXAxis() < 0.5; }
  public boolean right() { return getXAxis() > -0.5; }
  
  public boolean up() { return getYAxis() < 0.5; }
  public boolean down() { return getYAxis() > -0.5; }
}
