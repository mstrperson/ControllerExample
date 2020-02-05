class PlayStationController extends Controller
{
  public PlayStationController(PApplet app)
  {
    super(app);
  }
  
  public boolean Triangle() { return buttonState[0]; }
  public boolean Circle() { return buttonState[1]; }
  public boolean X() { return buttonState[2]; }
  public boolean Square() { return buttonState[3]; }
  
  public boolean L1() { return buttonState[4]; }
  public boolean R1() { return buttonState[5]; }
  public boolean L2() { return buttonState[6]; }
  public boolean R2() { return buttonState[7]; }
  
  public boolean Select() { return buttonState[8]; }
  public boolean Start() { return buttonState[9]; }
  
  public boolean L3() { return buttonState[10]; }
  public boolean R3() { return buttonState[11]; }
  
  
  public boolean left() { return int(getXAxis()) < 0; }
  public boolean right() { return int(getXAxis()) > 0; }
  
  public boolean up() { return int(getYAxis()) < 0; }
  public boolean down() { return int(getYAxis()) > 0; }
  
  public float Lx() 
  { 
    float v = super.control1.getSlider("x").getValue();
    
    if(abs(v) < 0.01) return 0;
    
    return v; 
  }
  public float Ly() 
  { 
    float v = super.control1.getSlider("y").getValue();
    
    if(abs(v) < 0.01) return 0;
    
    return v; 
  }
  
  public float Rx() 
  { 
    float v = super.control1.getSlider("rz").getValue();
    
    if(abs(v) < 0.01) return 0;
    
    return v; 
  }
  public float Ry() 
  { 
    float v = super.control1.getSlider("z").getValue();
    
    if(abs(v) < 0.01) return 0;
    
    return v; 
  }
}
