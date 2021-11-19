// A simple Particle class

class Particle1 {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle1(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1.5, 1.5), random(-3, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    String []txt1_1 ={ "T", "o", " ", "b", "e", " ", "o", "r", " ", "n", "o", "t", " ", "t", "o", " ", "b", "e"};
    //stroke(255, lifespan/2);
    //fill(255, lifespan/4);
    //ellipse(position.x, position.y, 20, 20);
    float a= random(-0.1,13.1);
    textSize(40);
    float angleTxt =random(TWO_PI);
   // rotate(angleTxt);
   fill(255, lifespan);
   stroke(4);
    text(txt1_1[int(a)] , position.x ,position.y);
    
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}
