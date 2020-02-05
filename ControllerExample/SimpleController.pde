class SimpleController extends Controller
{
  public SimpleController(PApplet app)
  {
    super(app);
  }
  
  public boolean Y() { return buttonState[0]; }
  public boolean B() { return buttonState[1]; }
  public boolean A() { return buttonState[2]; }
  public boolean X() { return buttonState[3]; }
  
  public boolean left() { return getXAxis() < 0; }
  public boolean right() { return getXAxis() > 0; }
  
  public boolean up() { return getYAxis() < 0; }
  public boolean down() { return getYAxis() > 0; }
}
