import java.util.Iterator;

ArrayList<Flake> myList;
void setup() {
  size(800, 400);
  myList=new ArrayList<Flake>();
  myList.add(new Hour5());
  myList.add(new Hour5());
  myList.add(new Hour5());
  
  myList.add(new Hour6());
  myList.add(new Hour6());
  myList.add(new Hour6());
}
void draw() {
  background(125);
  frameRate(8);

  Iterator<Flake> it = myList.iterator();
  while (it.hasNext()) {
    Flake f = it.next();
    f.display();
    f.addPhysics();
    f.somethingSpecial();

    if (f.isDead()) {
      f.snow();
    }
  }
}

interface Flake {
  void snow(); //resets flake
  void display(); //flake identity, ellipse
  void addPhysics(); //Velocity, acceleration, location (experiement with these!)
  void somethingSpecial();
  boolean isDead(); //snow at bottom of screen(will be provided, but can be changed!)
  
}



class Hour5 implements Flake {

  PVector velocity;
  PVector location;
  PVector acceleration;
  float lifespan;
  float diameter = random(5, 10);
  PFont mono;//for something special!

  Hour5() {
    location = new PVector(random(-3, 800), random(-3, 20));
    velocity = new PVector(random(-.22, .22), 5);
    acceleration = new PVector(0, 0.001);
    lifespan=255;
    mono = createFont("GloriaHallelujah.ttf", 22);
    //mono = createFont("https://fonts.googleapis.com/css?family=Courgette", 22);
  }
  Hour5(int x, int y) {
  }

  void snow() {
    location.y=random(-2, 10);
    location.x=random(width);
    lifespan=255;
  }

  void display() {
    
    lifespan -= 3.0;
    noStroke();
    smooth();
    fill(random(250, 255), random(250, 255), random(250, 255), lifespan);
    if (location.y>height||location.y<-30) {
      location.y=random(0, 40);
    }
    if (location.x>width||location.x<-30) {
      location.x=random(0, 800);
    }
    text("Hour5", location.x+30, location.y);
    ellipse(location.x, location.y, diameter, diameter);
  }
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void addPhysics() {
    PVector gravity = new PVector(random(0, 2), random(0, 20));
    acceleration=PVector.random2D();
    velocity.add(acceleration);
    location.add(velocity);
    location.add(gravity);
  }
  void somethingSpecial() {
    textFont(mono);
    text("somethingSpecial:", 12, 60);
  }
}
class Hour6 implements Flake {
  
  PVector velocity;
  PVector location;
  PVector acceleration;
  float lifespan;
  float diameter = random(5, 10);
  PFont mont;//for something special!

  Hour6() {
    location = new PVector(random(-3, 800), random(-3, 20));
    velocity = new PVector(random(-.22, .22), 5);
    acceleration = new PVector(0, 0.001);
    lifespan=255;
   mont = createFont("Dekko-Regular.ttf", 32);
   // mont = createFont("https://fonts.googleapis.com/css?family=Sigmar+One", 32);
    
  }
  Hour6(int x, int y) {
  }
  void snow() {
    location.y=random(-2, 10);
    location.x=random(width);
    lifespan=255;
  }
  void display() {
    lifespan -= 3.0;
    noStroke();
    smooth();
    fill(random(100, 255), 0, 0, lifespan);
    if (location.y>height||location.y<-30) {
      location.y=random(0, 40);
    }
    if (location.x>width||location.x<-30) {
      location.x=random(0, 800);
    }
    text("Hour6", location.x+30, location.y);
    ellipse(location.x, location.y, diameter, diameter);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  void addPhysics() {
    PVector gravity = new PVector(random(0, 2), random(0, 20));
    acceleration=PVector.random2D();
    velocity.add(acceleration);
    location.add(velocity);
    location.add(gravity);
  }
  void somethingSpecial() {
   textFont(mont);
   text("GoogleFonts!", 12, 100);
  }
}

