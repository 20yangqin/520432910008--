Button[] bt;

float speed = 0;
float easing = 0.07;
float btWidth = 30;
float btHeight = 20;
color brushColor = 255; // brush's color
float bc;
float target = dist(mouseX, mouseY, pmouseX, pmouseY);


void setup() {
  size(800, 800);
  background(0);
  bt = new Button[5];
  smooth();

  // make the different color for each button
  for (int i = 0; i < bt.length; i ++) {
    color cc = color(random(255), random(255), random(255));
    bt[i] = new Button(20+(btWidth+10)*i, 30, btWidth, btHeight, cc);
  }
}


void draw() {
  //background(0);

  pushStyle();
  fill(175);
  noStroke();
  rect(0, 0, width, btHeight*2+40);
  popStyle();

  float ww =  btWidth*4;
  float rr = 50;
  // change the background
  color c;
  c = color (random(255), random(255), random(255), random(70, 99));
  if (240 < mouseX && mouseX < 240+ww && 55<mouseY && mouseY < 55+btHeight && mousePressed) {
    fill(c);
    rect(0, 0, width, height);
  }

  // show the button and reach the color
  for (int i = 0; i < bt.length; i ++) {
    bt[i].showButton();
    if (bt[i].pickColor) {
      brushColor = bt[i].buttonColor;
      bt[i].pickColor = false;
    }
  }

  brushButton();
  clearButton();
}


void brush1() {

  //make a ellipse and a circle.
  //the speed of the mouse makes it different
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  float a = random(TWO_PI);
  float rr=random(10);
  float x =mouseX +cos(a) * random(15);
  float y =mouseY +sin(a) * random(15);
  if (mousePressed) {

    stroke(brushColor);
    strokeWeight(target*0.5);
    fill(brushColor);
    ellipse(x, y, rr, rr);
  }
}


void brush2() {

  //some ellipses and lines
  if (mousePressed) {
    float speed=0.1;
    float i= 1;
    float rr =3;
    float target = dist(mouseX, mouseY, pmouseX, pmouseY);
    float adds= target/6 *speed;
    fill(brushColor);
    stroke(brushColor);
    ellipse(mouseX, mouseY, rr+adds, rr+adds);
    i++;
  }
  float speed=0.8;
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  float adds= target/3 *speed;
  strokeWeight(adds*0.4);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void brush3() {
  // some ellipses
  if (mousePressed) {
    fill(brushColor);
    float xx = mouseX + random(-20, 20);
    float yy = mouseY + random(-20, 20);
    float distance = dist(xx, yy, mouseX, mouseY);
    float rr = 4/distance*20;
    if (rr> 30) {
      rr = 28;
    }
    float ap = 1 /distance *12;
    fill(brushColor);
    ellipse(xx, yy, rr, rr);
  }
}


void clearButton() {

  //clear the canvas
  boolean hover=false;
  float ww =  btWidth*2.2;
  fill(255);
  noStroke();
  rect(240, 30, ww, btHeight);
  textSize(18);
  fill(0);
  text("Clear", 255, 48);
  if (240 < mouseX && mouseX < 240 + ww && 30 < mouseY && mouseY< 30+btHeight) {
    hover= true;
  }
  if (hover == true && mousePressed) {
    clear();
  }
}



void brushButton() {

  //for change the brushes
  fill(255);
  noStroke();
  float rr = 50;
  float ww =  btWidth*2.5;
  rect(370, 30, ww, btHeight);
  rect(460, 30, ww, btHeight);
  rect(550, 30, ww, btHeight);
  rect(640, 30, 2.5*ww, btHeight);
  //rect(640, 55, 2.5*ww, btHeight);

  fill(0);
  textSize(18);
  text("Brush1", 380, 48);
  text("Brush2", 470, 48);
  text("Brush3", 560, 48);
  text("Enter 1-3 for a brush", 645, 48);

  float ww1 =  btWidth*4;
  fill(255);
  noStroke();
  rect(240, 55, ww1, btHeight);
  textSize(18);
  fill(0);
  text("Background", 255, 72);
  //text("Enter 'e' for a eraser", 645, 72);

  if (keyPressed) {
    if (key == '1') {
      fill(100);
      rect(370, 30, ww, btHeight);
      text("Brush1", 380, 48);
      brush1();
    } else if (key == '2') {
      fill(100);
      rect(460, 30, ww, btHeight);
      text("Brush2", 470, 48);
      brush2();
    } else if (key == '3') {
      fill(100);
      rect(550, 30, ww, btHeight);
      text("Brush3", 560, 48);
      brush3();
    } else {
    }

    if (240 < mouseX && mouseX < 240+ww1 && 55<mouseY && mouseY < 55+btHeight && mousePressed) {
      fill(100);
      rect(240, 55, ww1, btHeight);
      textSize(18);
      fill(0);
      text("Background", 255, 72);
    }
  }
}
