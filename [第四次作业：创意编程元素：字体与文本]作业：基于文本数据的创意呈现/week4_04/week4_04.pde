float x, y, angle;
PFont f;
String txt = "寒冷";


void setup() {
  frameRate = 10;
  size(1000, 1000);
  background(0);
  f = createFont("微软雅黑", 10, true);
  noStroke();
}

void draw() {
  snowFlake();
}

void snowFlake() {

  angle += 0.01;
  x = sin(angle) * 150;
  y = cos(angle) * 150;
  for (int i = 0; i< txt.length(); i++) {
    char everyc =txt.charAt(i);
    float w = textWidth(everyc);
  }
  translate(width / 2, height / 2);
  pushMatrix();
  scale(1 + 2* sin(angle * 10));
  textFont(f);
  textAlign(CENTER);
  fill(0, 408, 612);
  text(txt, x, y);
  popMatrix();
}
