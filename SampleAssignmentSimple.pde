//flake[] flake = new flake[0];
ArrayList<flake> flakes=new ArrayList<flake>();
int total = 500;
PImage snowman;
void setup () {
  size (1200, 800);
  snowman= loadImage("snowman.jpg");
}

void draw() {
  background(14,35,61);
  fill(255);
  //flake = (flake[]) append(flake, new flake(300, 0));
  flakes.add(new flake(random (0, 1200),0, random (5, 10), random(-2,2), random(0,5)));
  if (flakes.size()>total) {
    flakes.remove(0);
  }

  for (int i=0; i<flakes.size(); i++) {
    flakes.get(i).setX(flakes.get(i).getX() + flakes.get(i).getxVel());
    flakes.get(i).setY(flakes.get(i).getY() + flakes.get(i).getyVel());
    ellipse(flakes.get(i).getX(), flakes.get(i).getY(), flakes.get(i).getDiameter(), flakes.get(i).getDiameter());
  }
  fill(255);
  rect(0,700,1200,100);
  textSize(80);
  fill(219,65,45);
  text("Merry", 150, 200);
  fill(14,140,15);
  text("Christmas", 150,300);
  triangle(800,600,950,400,1100,600);
  triangle(825,500,950,300,1075,500);
  triangle(850,400,950,200,1050,400);
  fill(139,69,19);
  rect(900,600,100,100);
  fill(255,255,0);
  star(950,200,75,25,6);
  fill(219,65,45);
  ellipse(900,550,35,35);
  ellipse(975,350,35,35);
  ellipse(925,450,35,35);
  ellipse(985,525,35,35);
  ellipse(900,550,35,35);
  fill(255);
  ellipse(300,625,150,150);
  ellipse(300,525,100,100);
  ellipse(300,450,75,75);
  fill(0);
  rect(250,410,100,10);
  rect(275,360,50,50);
  fill(219,65,45);
  rect(275,390,50,20);
  image(snowman,278,432,40,40);
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
class flake {

  float x;  
  float y;
  float xVel;
  float yVel; 
  float diameter;

  flake(float xpos, float ypos, float dia, float xv, float yv) {
    x = xpos; 
    y = ypos;
    xVel = xv;
    yVel = yv;
    diameter = dia;
  }
  float getX(){
    return x;
  }
  float getxVel(){
    return xVel;
  }
  float getyVel(){
    return yVel;
  }
  void setX(float xValue){
    x = xValue;
  } 
  float getY(){
    return y;
  }
  void setY(float yValue){
    y = yValue;
  } 
  float getDiameter(){
    return diameter;
  }
  void setDiameter(float diameterValue){
    diameter = diameterValue;
  } 
}
