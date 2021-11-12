class Particle {
  PVector loc, vel, acc, center, mouse ;
  float lifespan;
  float angle;
  float offset;
  float rr;
  Particle(PVector l) {
//acc = new PVector(0, 0.05);
    
    loc = new PVector(width/2 +cos(angle)*random(10),height/2+sin(angle)*random(10));
    loc = l.copy();
    lifespan = 255.0;
    center =new PVector(width/2, height/2);
    mouse = new PVector(mouseX, mouseY);
    offset = map(PVector.dist(mouse, center), 0, 600, 60, 500);
    angle = (random(TWO_PI));
     int n = int(map(offset , 60 , 500 ,40 ,500));
     vel = new PVector(cos(n)*2 ,sin(n)*2);
  }
  
  void run(){
    update();
    circle();
    //display();
  }

  void update() {
    //vel.add(acc);
    loc.add(vel);
    lifespan --;
    
  }
  void circle() {
    stroke(255,15);
    noFill();
    beginShape();
    int n = int(map(offset , 60 , 500 ,40 ,500));
    for (int vi = 0; vi < n; vi++) {
      float thetaV = map(vi, 0, n, 0, TWO_PI);
      float x = loc.x + cos(thetaV) * offset*0.8;
      float y = loc.y + sin(thetaV) * offset*0.8;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
  
 /* void display(){
   stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(loc.x, loc.y, 8, 8); 
  }*/
}
