# ControllerExample

1) Drop the Controller.pde file into any project.
2) Call `initializeControllers()` in the `setup()` method.
3) Use Player1 and Player2 as needed.

## Requires
Game Control Plus library (org.gamecontrolplus.*)

## Globals
### Properties
* Controllers : ArrayList<Controller>     Collection of all of the Controllers connected to this computer (in case you have more than 2).
* Player1 : Controller                    First Controller found.
* Player2 : Controller                    Second Controller found.

### Methods
* getControllers() : ArrayList<Controller>    Called at the initiallization of the Controllers property.
* initializeControllers() : void              Call this method in setup() in your program.  Initializes the update thread and Player1 and Player2 Properties
* update() : void                             runing method for the thread the keeps the buttonState on each controller updated.

## Controller
### Properties
* *xAxisName : String*        Name of the X axis on this controller. (private)
* *yAxisName : String*        Name of the Y axis on this controller. (private)
* *input : ControlIO*         ControlIO instance (private)
* *control1 : ControlDevice*  encapsulated ControlDevice this Controller accesses (private)
* buttonState : boolean[]   The current state of all of the buttons on this controller

### Constructor
* Controller(PApplet app, int n)      initializes the controller using the n'th controller from the input list.

### Methods
* updateButtonState() : void          Called by the update thread.  Don't need to worry about it.
* getXAxis() : float                  Analog value of the x axis.
* getYAxis() : float                  Analog value of the y axis.
* X() : boolean                       shortcut for button[0]
* Y() : boolean                       shortcut for button[3]
* A() : boolean                       shortcut for button[2]
* B() : boolean                       shortcut for button[1]
* left() : boolean                    shortcut for xAxis < -0.5
* right() : boolean                   shortcut for xAxis > 0.5
* up() : boolean                      shortcut for yAxis < -0.5
* down() : boolean                    shortcut for yAxis > 0.5
