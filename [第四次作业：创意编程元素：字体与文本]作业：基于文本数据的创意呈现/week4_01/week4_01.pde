PFont f2;
String message2 = "冷 ";
float angle;
int x, y;

void setup() {

  size(800, 800);
  background(0);
  f2 = createFont("微软雅黑", 18, true);
}

void draw() {
  fill(0, 12); //Aplha
  rect(0, 0, width, height);
  angle +=0.25;
  y=y-5;
  pushMatrix();
  translate(width/2 ,height/2);
  rotate(angle);
  fill(0, 408, 612);
  textFont(f2);
  text(message2, x, y);
  popMatrix();
  if (y<-600) {
    y = 0;
  }
}
