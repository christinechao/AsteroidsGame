private SpaceShip spaceshipOne;
private Asteroid [] asteroids;
Star [] stars;
public void setup() 
{
  background(#180C4A);
  size(1000,600);
  spaceshipOne = new SpaceShip();
  stars = new Star[120];
  for(int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
  asteroids = new Asteroid[10];
  for(int i=0; i<asteroids.length; i++){
    asteroids[i] = new Asteroid();
  }
}
public void draw() 
{
  background(#180C4A);
  for(int i=0; i<stars.length; i++){
    stars[i].show();
  }
  for(int i=0; i<asteroids.length; i++){
    asteroids[i].show();
    asteroids[i].move();
  }
  spaceshipOne.show();
  spaceshipOne.move();



  if (keyPressed == true){
    if(keyCode == LEFT){
    spaceshipOne.rotate(-10);
    }
    if(keyCode == RIGHT){
      spaceshipOne.rotate(10);
    }
    if(keyCode == UP){
      spaceshipOne.accelerate(0.03);
    }
    if(keyCode == DOWN){
    spaceshipOne.accelerate(-0.03);
    }
  }
}

void keyPressed(){
  if(key == 'h'){
      spaceshipOne.setX((int)(Math.random()*1000));
      spaceshipOne.setY((int)(Math.random()*600));
      spaceshipOne.setPointDirection(0);
      spaceshipOne.setDirectionX(0);
      spaceshipOne.setDirectionY(0);
    }
}
class Star{
  private int myX, myY;
  Star(){
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*600);
  }

  public void show(){
    noStroke();
    fill(255);
    float angle = TWO_PI / 5;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = myX + cos(a) * 2;
      float sy = myY + sin(a) * 2;
      vertex(sx, sy);
      sx = myX + cos(a+halfAngle) * 5;
      sy = myY + sin(a+halfAngle) * 5;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }

}

class Asteroid extends Floater{
private int rotSpeed;
  public Asteroid(){
    rotSpeed = (int)(Math.random()*2)+1;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11*3;
    yCorners[0] = -8*3;
    xCorners[1] = 7*3;
    yCorners[1] = -8*3;
    xCorners[2] = 13*3;
    yCorners[2] = 0;
    xCorners[3] = 6*3;
    yCorners[3] = 10*3;
    xCorners[4] = -11*3;
    yCorners[4] = 8*3;
    xCorners[5] = -5*5;
    yCorners[5] = 0;
    myColor = color(179, 177, 177);   
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = (int)(Math.random()*3)-1;
    myDirectionY = (int)(Math.random()*3)-1;
  }
  public void move(){
    rotate(rotSpeed);
    super.move();
  }
  public void setX(int x) { myCenterX = x; }  
  public int getX() { return (int) myCenterX;} 
  public void setY(int y) { myCenterY = y; }   
  public int getY() { return (int)myCenterY;}   
  public void setDirectionX(double x) { myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) { myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 
  }

class SpaceShip extends Floater  
{   
  public SpaceShip(){
    corners =3; 
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myColor = color(236, 169, 225);   
    myCenterX = 500;
    myCenterY = 300;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }

  public void setX(int x) { myCenterX = x; }  
  public int getX() { return (int) myCenterX;} 
  public void setY(int y) { myCenterY = y; }   
  public int getY() { return (int)myCenterY;}   
  public void setDirectionX(double x) { myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}   
  public void setPointDirection(int degrees) { myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;} 

}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

