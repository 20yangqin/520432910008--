PFont f1;
//PFont f2;
String message1 = "I' m so cold!!!  ";
//String message2 = "冷 ";
int x, y;
//float angle;



void setup() {
  frameRate=200;
  size(800, 800);
  background(0);
  f1 = createFont("Arial", 110, true);
  //f2 = createFont("微软雅黑", 90, true);
}

void draw() {

  fill(0, 12); //Aplha
  rect(0, 0, width, height);


  translate(width/2, height/2);
  noFill();
  noStroke();

  float arclength = 0;  //Make the words in the shape of a round
  float r = textWidth(message1)/(2*PI);
  for (int i = 0; i<message1.length(); i++) {
    char everyc = message1.charAt(i);
    float w = textWidth(everyc);
    float aa = mouseX; // Make some changes
    float bb = mouseY;

    arclength += w/2;
    float theta = PI +arclength/r ;

    pushMatrix();
    translate(r*cos(theta)+random(-6, 6), r*sin(theta)+random(-6, 6)); //Shake the circle and determine the location of each word
    rotate(theta+ PI/3);
    fill(0, 408, 612);
    textFont(f1);
    textAlign(CENTER);
    text(everyc, aa, bb);
    popMatrix();
    arclength += w/2;
   

    /*angle +=0.25;
     y=y-5; //Make a cirle
     pushMatrix();
     rotate(angle);
     textFont(f2);
     text(message2, x, y);
     popMatrix();
     if (y<-800) {
     y = 0;
     }*/
  }
}
