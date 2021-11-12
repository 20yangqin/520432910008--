int num;

void setup() {
  fullScreen();
  background(0);
}

void draw() {
  translate(width/2, height/2);
  fill(0, 60);
  rect(-width/2-20, -height/2-20, width+50, height+50);
  float a, b, c, d;
  strokeWeight(1);

  float mag = 150;
  stroke(0);
//the values of a , b , c , d are  related to the mouse position.
  a = map(mouseX, 0, width, -3, 3 );
  b = map(mouseX, 0, width, -3, 3 );
  c = map(mouseY, 0, height, -3, 3 );
  d = map(mouseY, height, 0, -3, 3 );

  float oldX = 0.5, oldY = 0.5;
  for (int i = 0; i < 400000; i++) {
    //Produces a small range of points
    //xn+1 = sin(a yn) - cos(b xn)
    //yn+1 = sin(c xn) - cos(d yn)
    float newX= sin(a * oldY) - cos(b * oldX);
    float newY= sin(c * oldX) - cos(d * oldY);
    stroke(int(num/250.0) % 255, int(num/250.0) % 255, 255, 10);
    // use "mag" to magnify random points within a circle with a radius of one.
    point(newX * mag, newY * mag);
    num +=5;

    oldX=newX;
    oldY=newY;
  }
  //saveFrame("frame/##.png");
}
