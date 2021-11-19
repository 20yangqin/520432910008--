class Particle {
 PVector pos;
 float lifeSpan;
 color col ;
 float angle;
 float noiseScale, noiseStrength;
 Particle(float x, float y, color col) {
   pos = new PVector(x, y);
   lifeSpan = 100;
   noiseScale = 800;
   noiseStrength = 90;
   this.col = col;
 }
 void run() {
   show();
   move();
 }
  void show() {
   noStroke();
   fill(col, lifeSpan);
   ellipse(pos.x, pos.y, 0.5,0.5);
  }
  
   void move() {
   angle = noise(pos.x/noiseScale, pos.y/noiseScale) * noiseStrength;
   pos.x += cos(angle) ;
   pos.y += sin(angle) ;
   lifeSpan -= 0.1;
   
 }
 boolean isDead() {
   if (lifeSpan < 0) {
     return true;
   } else {
     return false;
   }
 }
}
