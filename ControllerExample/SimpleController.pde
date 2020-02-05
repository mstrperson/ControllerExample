class SimpleController extends Controller
{
  public SimpleController(PApplet app)
  {
    super(app);
  }
  
  public boolean X() { return buttonState[0]; }
  public boolean B() { return buttonState[1]; }
  public boolean A() { return buttonState[2]; }
  public boolean Y() { return buttonState[3]; }
  
  public boolean left() { return int(getXAxis()) < 0; }
  public boolean right() { return int(getXAxis()) > 0; }
  
  public boolean up() { return int(getYAxis()) < 0; }
  public boolean down() { return int(getYAxis()) > 0; }
}
