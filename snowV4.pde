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