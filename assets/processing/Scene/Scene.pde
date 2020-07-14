
ArrayList<MovingObject> objects;
color c1, c2, bg;
int randRateClouds, randRateMountains;

void setup() {
  size(1000,600);
  frameRate(24);
    
  c1 = color(230,164, 157);//255, 228, 225);
  c2 = color(120,98,204);//130,189,150);//  244, 238, 224); //172,157,230
  bg = c1;
  background(bg);
  
  objects =  new ArrayList<MovingObject>();
  objects.add(new Sun());
  
  randRateClouds = (int)random(frameRate*5);
  randRateMountains = (int)random(frameRate*4);
}

void draw() { 
  colorMode(HSB,255);
  background(bg);
  bg = lerpColor(c1, c2, (float)mouseX/width);
  colorMode(RGB,255);

  for (int i = 0; i < objects.size(); i++){
    objects.get(i).display();
    objects.get(i).move();
    if(objects.get(i).getY() > height)
      objects.remove(i);
  }
  
  randRateClouds--;
  if (randRateClouds <= 0){
    objects.add(new Cloud(random(height-75), random(255)));
    randRateClouds = (int)random(frameRate*5);
  }
  
  randRateMountains--;
  if (randRateMountains <= 0){
    objects.add(new Mountain(random(200,400),random(150,300)));
    randRateMountains = (int)random(frameRate*4,frameRate*7);
  } 
}

void mouseDragged(){
  int n = (int)random(3);
  for (int i = 0; i <n; i++)
    objects.add(new Spark(mouseX, mouseY));
}

void mousePressed(){
  int n = (int)random(3,5);
  for (int i = 0; i <n; i++)
    objects.add(new Spark(mouseX, mouseY));
}

//NEW CLASS
class MovingObject{
  float x, y, xoffset, yoffset;
  
  MovingObject(float xinit, float yinit){
    x = xinit;
    y = yinit;
    xoffset = -2;
    yoffset = 0;
  }
  
  MovingObject(){
    x = width;
    y = yoffset = 0;
    xoffset = -2;
  }
  
  void display(){
  }
  
  void move(){
    x += xoffset;
    y += yoffset;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  void setXOffset(float xoff){
    xoffset = xoff;
  }
  void setYOffset(float yoff){
    yoffset = yoff;
  }
  
}

//NEw CLASS

class Sun extends MovingObject {
  float size;
  color innerColor, outerColor;

  Sun() {
    super(width, 100);
    size = 40;
    innerColor = color (255, 204, 0);
    outerColor = color (255,165,0);
    yoffset = -.35;
  }

  void display() {
    noStroke();
    fill(outerColor);
    ellipse(x, y, size +10, size +10);
    fill(innerColor);
    ellipse(x, y, size, size);
  }
  
  void move(){
    if (x < width/2)
      yoffset = .3;
    if (x+size < 0){
      x = width + size;
      y = 100;
      yoffset = -.35;
    }
    x += xoffset;
    y += yoffset;
  }
}

//New ClASS
class Mountain extends MovingObject{
  color[] colors = {color (176, 196, 222), color(117,151,197), color(222,205,176),
    color(222,194,176)};
  float line, base, x2, y2, x3, y3;
  color c;
  
  Mountain(float l, float b){
    super(width, height);
    line = l;
    base = b;
    x2 = x+(base/2);
    y2 = y - line;
    x3 = x +base;
    y3 = y;
    c = colors[(int)random(colors.length)];
  }

  void move(){
    x += xoffset;
    x2 += xoffset;
    x3 += xoffset;
  }
  
  void display(){
    noFill();
    fill(c);
    triangle(x,y,x2,y2,x3,y3);
    fill(red(c)+25, green(c)+25, blue(c)+25);
    triangle(x,y, x2,y2, x+(base/3),y3);
  }
}
//NEW CLASS
class Cloud extends MovingObject{
  color c;
  
  Cloud(float y, float a){
    super(width, y);
    c = color (255, 255, 255, a);
  }
  
  void display(){
    fill(c);
    ellipse(x, y, 50, 30);
  }
  
}
//NEW CLASS
class Spark extends MovingObject{
  PVector location, velocity, gravity;
  color c;
  
  Spark(float x, float y){
    super(x,y);
    xoffset = random(-2,2);
    yoffset = random(-3,-.5);
    location = new PVector(x,y);
    velocity = new PVector(xoffset, yoffset);
    gravity = new PVector(0, (float)1/16);
    c = color(random(255),random(255),random(255));
  }
  
  void display(){
    fill(c);
    ellipse(location.x, location.y, 5, 5);
  }
  void move(){
    location.add(velocity);
    velocity.add(gravity);
  }
}
