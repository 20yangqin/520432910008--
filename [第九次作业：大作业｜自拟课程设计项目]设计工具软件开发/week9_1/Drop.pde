class Drop {
  float x = random(width/10, width/10*9);
  float y = random( height/10*9-20);
  float speedY = random(4, 10);

  color c =#C2A9F2;
  void fall() {
    y += speedY;
    if (y>height/10*9) {
      y =random( height/10*9-20);
    }
  }

  void show() {
    strokeWeight(3);
    float apha = map(y, height/10, height/10*9, 90, 50);
    stroke(c, 80);
    line(x, y, x, y+random(1, 20));
  }

  void colorChange() {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    c = color(r, g, b);
  }
}
