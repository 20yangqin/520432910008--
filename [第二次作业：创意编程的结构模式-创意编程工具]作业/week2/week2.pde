int x, y = 0;
int endline1 = width;
int endline2 = height;
int s =10;

void setup() {
  size(900, 600);
  background(0);
  frameRate(15);
}

void draw() {
  for (x=0; x<= width; x=x+s) {
    stroke(random(14, 11), random(183, 255), random(120, 255), random(0, 100));
    line(x, y, x, height); // draw vertical lines
  }

  for (x=0; y<= height; y=y+s) {
    stroke(random(157, 103), random(0, 255), random(59, 166), random(0, 100));
    line(x, y, width, y); // draw horizonal lines
  } //background

  // draw rects
  noStroke();
  fill(random(100, 255), random(0, 255), random(70, 255), random(60, 90));
  rect(random(0, 900), random(0, 600), random(5, 300), random(5, 200));
}
