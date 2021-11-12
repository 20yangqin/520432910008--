ArrayList<ParticleSystem> systems;

void setup() {
  background(0);
  size(1000, 750);
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
 fill(0,80);
 rect(0,0 ,width ,height);
  for (ParticleSystem ps : systems) {
    ps.run();
    
    ps.addParticle();
    saveFrame("frames/##.png");
  }
}


void mousePressed() {
  systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
}
