import org.gamecontrolplus.*;

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
