void setup() {
  size(800, 800);
  background(255);
}


void draw() {
  if (mousePressed) {
    mondrian();
  }
}

void mondrian() {
  float w1 = random(width/3);
  float w2 = w1 + random(width/3);
  float w3 =width - w1 - w2;
  float h1 = random(height/3);
  float h2 = h1 + random(width/3);
  float h3 =height - h1 - h2;

  // divide canvas into seven pieces
  fill(random(188, 255));
  stroke(random(10));
  rect(w1+w2, 0, w3, h1);

  stroke(random(15));
  fill(random(188, 255));
  rect(w1, h1, w2, h2);

  stroke(random(10));
  fill(random(188, 255));
  rect(0, h1+h2, w1, h3);

  fill(random(90, 105));
  stroke(random(10));
  rect(0, 0, w1, h1+h2);

  stroke(random(20));
  fill(random(220, 255));
  rect(w1, 0, w2, h1);

  fill(random(188, 255));
  stroke(random(20));
  rect(w1+w2, h1, w3, h2);

  stroke(random(15));
  fill(random(20, 100));
  rect(w1, h1+h2, width, height);

  // Make some lines
  int i=100;
  float x1 = random(30)*width/i;
  float y1 = random(30)*height/i;
  strokeWeight(random(15));
  line(x1, 0, x1, h1+ h2);
  line(0, y1, w1+w2, y1);
  line(w1+w2, 0, w1+w2, h1+h2);
  float x2 = random(34, 66)*width/i;
  float y2 = random(34, 66)*height/i;
  line(x2, 0, x2, width);
  line(0, y2, w1+w2, y2);
  line(w1, y2, width, y2);
  line(w1 + w2, 0, w1+w2, height);
  float x3 = random(66, 100)*width/i;
  float y3 = random(66, 100)*height/i;
  fill(random(50, 150));
  rect(x3, y3, width, height);
  fill(random(50));
  rect(w1+w2, h1+h2, w3, h3);
  line(x3, 0, x3, h1+h2);
  line(w1, y3, width, y3);
  line(w1 + w2, 0, w1+w2, height);
  line(x3, height, x3, y1);
}
