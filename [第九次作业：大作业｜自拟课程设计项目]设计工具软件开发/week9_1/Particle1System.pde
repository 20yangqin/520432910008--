// An ArrayList is used to manage the list of Particles

class Particle1System {

  ArrayList<Particle1> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  Particle1System(int num, PVector v) {
    particles = new ArrayList<Particle1>();   // Initialize the arraylist
    origin = v.copy();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle1(origin));    // Add "num" amount of particles to the arraylist
    }
  }


  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle1 p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    Particle1 p;
    // Add either a Particle or CrazyParticle to the system
    if (int(random(0, 2)) == 0) {
      p = new Particle1(origin);
    } 
    else {
      p = new CrazyParticle(origin);
    }
    particles.add(p);
  }

  void addParticle(Particle1 p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    return particles.isEmpty();
  }
}
