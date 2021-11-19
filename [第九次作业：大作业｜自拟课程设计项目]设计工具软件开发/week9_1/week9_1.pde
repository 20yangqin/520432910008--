import ddf.minim.*;
Minim minim;
AudioPlayer music;
import java.util.*;
import geomerative.*;


RFont f;
RShape grp, grp1, grp2;
RPoint[] points, points1;

PFont font;

float voice;

int sit;
ArrayList<Particle> particles;
ArrayList<Particle1System> systems;

color[] colors = { #F49CBB, #DD2D4A, #F26A8D, #CBEEF3};
color c1;
color brushColor = 255;
color cc1 =#BBB0C1;
color cc2 =#FAF3E1;

int n = 120;
boolean hover;

int play;
int flag, flag1;
int flag2 =-1;
int flag3 =-1;
int flag4 =-1;

//int score = 0;
float btWidth = 50;
float btHeight = 100;
float txtColor;
float txtSize=120;
//float txt1Size = 120;
String txt1 = "To be or not to be";
String []txt1_1 ={ "T", "o", " ", "b", "e", " ", "o", "r", " ", "n", "o", "t", " ", "t", "o", " ", "b", "e"};

PVector [] dots;
PVector mouse;
PVector seed;
float mouseAngle;

float nx = 0;
float ny = 0;

float angleRate=0.0;
float angle2;


float theta, step;
int num=4, frames = 1400;

Button[] bt;
Button[] bt1;
Letter[] letters;
Letter1[] letters1;
Layer[] layers = new Layer[num];
Drop[] drops = new Drop[500];




void setup() {
  frameRate(20);
  fullScreen();
  rectMode(CENTER);
  minim = new Minim(this);
  music = minim.loadFile("music.mp3", 1024);
  music.loop();
  if (sit == 0) newParticles();
  //if (sit == 1) background(#FCFCF0);
  //if (sit == 2) playForm();

  if (sit == 5) {
  }
  RG.init(this);

  float a=150;
  grp = RG.getText("Start!", "FreeSans.ttf", int(a), CENTER);
  grp1 = RG.getText(" Read ! ", "FreeSans.ttf", 100, CENTER);
  grp2 = RG.getText(" To be or not to be ", "FreeSans.ttf", 100, CENTER);
  //grp2 = RG.getText(" My homework ", "FreeSans.ttf", 100, CENTER);
  font = createFont("Arial", 200);
  textFont(font);
  letters = new Letter[txt1.length()];
  letters1 = new Letter1[txt1.length()];
  int txt1X_1 = 280;
  int txt1X_2 = 200;
  for (int i = 0; i < txt1.length (); i ++ ) {
    letters[i] = new Letter(txt1X_1, height/2, txt1.charAt(i));
    txt1X_1 += textWidth(txt1.charAt(i));
  }

  for (int i = 0; i < txt1.length (); i ++ ) {
    letters1[i] = new Letter1(txt1X_2, height/2-250, txt1.charAt(i));
    txt1X_2 += textWidth(txt1.charAt(i))/2.8;
  }
  systems = new ArrayList<Particle1System>();

  step = (height-500)/num;
  for (int i=0; i<num; i++) {
    layers[i] = new Layer(width/10+i*step, random(400), i);
  }
  
  for (int i = 0; i < 500; i++) {
    drops[i]= new Drop();
  }
  
  smooth();
  frameRate(24);
  
}


void newParticles() {
  particles = new ArrayList<Particle>();
  background(#FCFCF0);
  forms();
  noiseSeed((int)random(100000));
}


void forms() {
  for (int j = 0; j < n; j ++) {
    float x = random(width), y = random(height);
    float s = random(40, 150);
    float hs = s/2;
    //int[] colors = {#e4572e, #29335c, #f3a712, #a8c686, #669bbc, #efc2f0};

    color c = colors[(int)random(colors.length)];
    noStroke();
    fill(c);
    if (random(1) > 0.5) {
      for (float i = -s/2; i < s/2; i ++) {
        particles.add(new Particle(x+i, y-hs, c));
        particles.add(new Particle(x+i, y+hs, c));
        particles.add(new Particle(x-hs, y+i, c));
        particles.add(new Particle(x+hs, y+i, c));
      }
      rect(x, y, s, s);
    } else {
      for (float a = 0; a < TWO_PI; a += TWO_PI/360) {
        particles.add(new Particle(x+hs*cos(a), y+hs*sin(a), c));
      }
      ellipse(x, y, s, s);
    }
  }
}


void draw() {
  voice = music.mix.level();
  if (sit == 0) {
    canvas1();
  }

  if (sit == 1) {
    canvas2();
  }
  if (sit == 2) {
    canvas3();
  }
  if (sit == 3) {
    canvas4();
  }
  if (sit == 4) {
    canvas5();
  }
  if (sit == 5) {
    canvas6();
  }
  println(sit);

  saveFrame("frames/##.png");
  }


void check1() {
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
}


void begin() {
  boolean hover = false;
  pushMatrix();
  pushStyle();
  translate(width/2, height/2);
  if (mouseX<300+width/2 && mouseX>-300+width/2 && mouseY < 90+height/2 && mouseY >70+height/2 ) {
    stroke(255);
    fill(#9164B7);
    hover = true;
  } else {
    stroke(255);
    fill(#DBD7F5, 90);
  }
  //fill(#DBD7F5,90);
  rect(0, 80, 600, 20);
  if (hover && mousePressed) {
    stroke(#F5EF43);
    strokeWeight(5);
    rect(0, 80, 600, 20);
    sit = 1;
  }
  fill(#1F6A8B, 0);
  noStroke();
  rect(0, 0, 600, 300);
  //float a=150;
  //a=(map(mouseY, 0, height, 150,300));
  //grp = RG.getText("Start!", "FreeSans.ttf", int(a), CENTER);
  RG.setPolygonizer(RG.ADAPTATIVE);
  grp.draw();
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
  points = grp.getPoints();
  // If there are any points
  float lifespan = 50;
  if (points != null) {
    noFill();
    stroke(#9164B7, lifespan);
    beginShape();
    for (int i=0; i<points.length; i++) {
      vertex(points[i].x, points[i].y);

      lifespan =10;
      lifespan --;
    }
    endShape();

    fill(#FCFCF0, 70);
    for (int i=0; i<points.length; i++) {
      ellipse(points[i].x, points[i].y, 3, 3);
    }
  }
  /*fill(#1F6A8B, 0);
   noStroke();
   rect(0, 0, 600, 300);*/
  popStyle();
  popMatrix();
}


void canvas1() {
  begin();
  check1();
}


void bc1() {
  pushMatrix();
  rectMode(CORNER);
  background(#FCFCF0);
  color []c = { #F49CBB, #43E4F5, #DD2D4A, #D99CE0};

  for (int i = 0; i < 4; i++) {
    float col = c[i];
    boolean hover = false;
    if (mouseX <(i+1)*width/4 && mouseX >i* width/4) {
      hover = true;
      stroke(255);
      strokeWeight(8);
    } else {
      noStroke();
    }
    fill(c[i]);
    rect(i*width/4, 0, width/4, height);
  }
  if (keyPressed && mouseX < width/4 && mouseX > width/4*0) {
    sit = 2;
  } else if (keyPressed && mouseX < width/4*2 && mouseX > width/4*1) {
    sit = 3;
  } else if (keyPressed && mouseX < width/4*3 && mouseX > width/4*2) {
    sit = 4;
  } else if (keyPressed && mouseX < width && mouseX > width/4*3) {
    sit = 5;
  }

  //println(sit);
  popMatrix();
}

void txtShow() {
  String []txt = {"Direction", "Text design", "Poster design", "Music choose"};
  for (int i =0; i< txt.length; i++) {
    fill(255);
    stroke(4);
    textSize(60);
    float a;
    a = map(txt.length, 0, width/4, 60, 200);
    text(txt[i], i*width/4 +a, height/2 -20, width, height);
  }
}

/*void mouseReleased() {
 canvas2();
 }*/

void canvas2() {
  bc1();
  txtShow();
}

void change1() {
  fill( #F49CBB);
  rect(0, 0, width, height);
}


void playStart() {
  pushMatrix();
  translate(width/2, height/2);
  rectMode(CENTER);
  fill(#F49CBB);
  stroke(#F26A8D);
  strokeWeight(20);
  rect(0, -30, 600, 300);
  //grp1.children[0].rotate(PI/20, grp.children[0].getCenter());
  strokeWeight(5);
  rectMode(CORNER);
  grp1.children[0].rotate(PI/20, grp.children[0].getCenter());
  grp1.draw();
  noStroke();
  if (mouseX > -300+ width/2 && mouseX <300+ width/2 && mouseY >-180 + height/2 && mouseY <120+height/2) {
    stroke(255);
    strokeWeight(10);
    noFill();
    rectMode(CENTER);
    rect(0, -30, 600, 300);
    noStroke();
    if (mousePressed) {
      fill(0, 100);
      rect(0, -30, 600, 300);
      play = 1;
    }
  }
  if (play==1) {
    boolean hover = false;
    fill(#F49CBB);
    rect(-width, -height, width*3, height*3);
    fill (255);
    rect(width/2-330, height/2-150, 200, 100);
    if (mouseX<width-400+180 && mouseX> width-400 &&mouseY <height-200+80 && mouseY > height-200) {
      hover = true;
      stroke(#F49CBB);
      strokeWeight(5);
      rect(width/2-360, height/2-160, 190, 90);
      textSize(70);
      fill(#F49CBB);
      text("Back", width/2-340, height/2-90);
    }
    if (hover==true && mousePressed) {
      sit = 1;
    }
  }

  //println(play);
  popMatrix();
}


void ReadNow() {
}


void canvas3() {
  change1();
  playStart();
  //playNow();
  //play();
}


/*void change2() {
 fill(#43E4F5);
 rect(0, 0, width, height);
 pushStyle();
 fill(#43D6E5);
 noStroke();
 rect(0, 0, width, 150);
 popStyle();
 }*/

void button() {
  fill(#43E4F5);
  rect(0, 0, width, height);
  pushStyle();
  fill(#43D6E5);
  noStroke();
  rect(0, 0, width, 150);
  popStyle();

  bt = new Button[8];
  for (int i = 0; i < bt.length; i ++) {
    bt[i] = new Button(50, 200+(btHeight+10)*i, btWidth*2, btHeight/2, 255);
  }
  for (int i = 0; i < bt.length; i ++) {
    bt[i].showButton();
    if (bt[i].pickColor) {
      brushColor = bt[i].buttonColor;
      bt[i].pickColor = false;
      flag = i+1;
    }
  }

  if (flag == 1) {
    //textSize(100);
    //text("a",500,500,150,150);
    textFont(font, 120);
    fill(255);
    for (int i = 0; i < letters.length; i ++ ) {
      letters[i].display();

      if (mousePressed) {
        letters[i].shake();
      } else {
        letters[i].origin();
      }
    }
  }

  if (flag == 2) {
    //textSize(100);
    //text("a",500,500,150,150);
    textFont(font, 75);
    fill(255);
    for (int i = 0; i < letters1.length; i ++ ) {
      letters1[i].display();

      if (mousePressed) {
        letters1[i].shake();
      } else {
        letters1[i].origin();
      }
    }
  }

  if (flag == 3) {
    pushMatrix();
    mouse = new PVector(mouseX, mouseY);
    mouseAngle = PVector.sub(mouse, new PVector(width/2, height/2)).heading()+TWO_PI;
    int total =200;
    dots = new PVector[total];
    float rad = width * 0.08;
    //textAlign(CENTER);
    //float x1 = cos(0)*rad;
    //float y1 = sin(0)*rad;
    translate(width/2+100, height/2);
    //ellipse(0, 0, 50, 50);
    nx +=0.001;
    ny +=0.001;
    for (int i = 0; i<total; i++) {
      float angle = TWO_PI*i/float(total);
      nx +=0.001;
      ny +=0.001;
      float x1 =cos(angle);
      float y1 =sin(angle);
      float nn =  (noise(x1+nx*0.5, y1+ny*0.5)*0.5+0.5);
      x1 *=(rad*nn);
      y1 *=(rad*nn);

      dots[i] = new PVector(x1, y1);
      //fill(#43E4F5,50);
      //rect(-300 ,-300 ,600 ,600);
      fill(255);
      ellipse(dots[i].x, dots[i].y, 10, 10);
    }

    for (int i = 0; i<txt1_1.length; i++) {
      int dotID = (i*13 + int( mouseAngle/(TWO_PI/total)))%total;
      noStroke();
      noFill();
      if (dotID == 0) {
        noStroke();
        float ang =atan2(dots[total-1].y- dots[1].y, dots[total-1].x -dots[1].x);
        pushMatrix();
        translate(dots[0].x, dots[0].y);
        //rotate(ang);
        textSize(40);
        text(txt1_1[i], 0, 40);
        popMatrix();
      } else if (dotID< total-1) {
        float ang =atan2(dots[dotID-1].y- dots[dotID+1].y, dots[dotID-1].x -dots[dotID+1].x);
        pushMatrix();
        noStroke();
        noFill();
        translate(dots[dotID].x, dots[dotID].y);
        rotate(ang);
        textSize(40);
        text(txt1_1[i], 0, 40);
        popMatrix();
      } else {
        float ang =atan2(dots[dotID-2].y- dots[dotID].y, dots[dotID-2].x -dots[dotID].x);
        pushMatrix();
        noStroke();
        noFill();
        translate(dots[dotID].x, dots[dotID].y);
        rotate(ang);
        textSize(40);
        text(txt1_1[i], 0, 40);
        popMatrix();
      }
    }
    popMatrix();
    println(flag);
  }

  if (flag == 4) {
    //fill(#43E4F5);
    //rect(400, 200, 1200, 1600);
    for (Particle1System ps : systems) {
      ps.run();
      ps.addParticle();
    }

    if (mousePressed && mouseX>200 && mouseY>100) {
      systems.add(new Particle1System(1, new PVector(mouseX, mouseY)));
    }
  }

  if (flag == 5) {
    //
    boolean hover=false;
    int count = 300;
    //fill(#43E4F5);
    //rect(400, 200, 1200, 1600);
    pushMatrix();
    translate(width/2+50, height/2+50);
    if (mouseX < width-500+160 && mouseX > width-500 && mouseY < height - 200+50 &&mouseY> height-200) {
      hover = true;
    }

    if (hover==true && mousePressed) {
      noStroke();
    } else {
      stroke(#F5EF43);
    }
    noFill();
    RG.setPolygonizer(RG.ADAPTATIVE);
    //grp2.draw();
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
    points = grp2.getPoints();
    if (points != null) {
      fill(#43E4F5);
      stroke(255);
      for (int i=0; i<points.length; i++) {
        float apha1;
        fill(255);

        ellipse(points[i].x, points[i].y, 3, 3);
        if (i>1) {
          //line(points[i-1].x *(1+noise(0.002)) , points[i-1].y*(1+noise(0.002)) ,points[i].x*(1+noise(0.002))  , points[i].y*(1+noise(0.002)) );
          pushMatrix();
          translate(points[i].x, points[i].y);
          float a, b, c, d;
          strokeWeight(1);

          float mag = 250;
          stroke(0);
          //the values of a , b , c , d are  related to the mouse position.
          a = map(mouseX, 0, width, -1, 1 );
          b = map(mouseX, 0, width, -3, 3 );
          c = map(mouseY, 0, height, -3, 3 );
          d = map(mouseY, height, 0, -3, 3 );

          float oldX = 0.5, oldY = 0.5;

          for (int j = 0; j < 10; j++) {
            //Produces a small range of points
            //xn+1 = sin(a yn) - cos(b xn)
            //yn+1 = sin(c xn) - cos(d yn)
            float newX= sin(a * oldY) - cos(b * oldX);
            float newY= sin(c * oldX) - cos(d * oldY);
            apha1 = map(dist(points[i].x, points[i].y, newX*mag, newY*mag), 0, 800, 70, 20);
            //color cc = int( map(dist(points[i].x,points[i].y,newX,newY),0,800,70,20));
            fill(255, 20);
            stroke(255, 20);
            line(points[i].x, points[i].y, newX*mag, newY*mag);
            float r =  map(dist(points[i].x, points[i].y, newX, newY), 0, 800, 5, 40);
            ellipse( newX*mag, newY*mag, r, r);
          }

          popMatrix();
        }
      }
    }
    popMatrix();
  }

  if (flag ==6) {
    float a =random(-3, 3);
    //ellipse(width/2, height/2, 50, 50);
    pushMatrix();
    translate(width/2+50, height/2+50);
    RG.setPolygonizer(RG.ADAPTATIVE);
    grp2.children[0].rotate(PI/20, grp2.children[0].getCenter());
    int num = int(random(10));
    grp2.children[num].rotate(PI/15, grp2.children[num].getCenter());
    grp2.draw();

    // Get the points on the curve's shape
    //RG.setPolygonizer(RG.UNIFORMSTEP);
    //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));

    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
    points = grp2.getPoints();
    if (points != null) {
      noFill();
      stroke(0, 200, 0);
      beginShape();
      for (int i=0; i<points.length; i++) {
        vertex(points[i].x, points[i].y);
      }
      endShape();

      fill(0);
      stroke(0);
      for (int i=0; i<points.length; i++) {
        ellipse(points[i].x, points[i].y, 5, 5);
      }
    }

    popMatrix();
  }

  if (flag == 7) {
    fill(#43E4F5, 12);
    rect(0, 0, width, height);
    if (mouseX  < width/2) {
      textRotate();
    }
  }

  if (flag == 8) {
    float a =random(-3, 3);
    //ellipse(width/2, height/2, 50, 50);
    pushMatrix();
    translate(width/2+50, height/2+50);
    RG.setPolygonizer(RG.ADAPTATIVE);
    //grp2.draw();
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
    points = grp2.getPoints();
    if (points != null) {
      for (int i=0; i<points.length; i++) {
        float floatRate = map(voice, 0, 1280, -2, 8 );
        float x = floatRate +points[i].x;
        float y = floatRate +points[i].y;
        // ellipse(points[i].x, points[i].y, voice*400, voice*400);
        fill(255);
        ellipse(x, y, voice*400, voice*400);
        stroke(#43E4F5);
        fill(#43E4F5);
        fill(x, y, voice*200, voice*200);
        if (voice*400<20) {
          for (int j = 0; j< 30; j++) {
            float  speedX = random(-1, 1);
            float speedY = random(-2, 0);
            float x1 = x +speedX;
            float x2 = x1;
            float y1 = y +speedY;
            float y2 = y1;
            float r  = 10;
            fill(255, 50);
            ellipse(x2, y2, r, r);
            x2 +=speedX;
            y2 +=speedY;
          }
        }
      }
    }


    popMatrix();
  }


  bt1 = new Button[5];
  for (int j= 0; j < bt1.length; j ++) {
    bt1[j] = new Button(70+(btHeight*4-5)*j, 45, btWidth*4, btHeight/2, #FCFCF0);
  }
  for (int j = 0; j < bt1.length; j ++) {
    bt1[j].showButton();
    if (bt1[j].pickColor) {
      brushColor = bt1[j].buttonColor;
      bt1[j].pickColor = false;
      flag1 = j+1;
    }
  }

  if (flag1 ==1) {
    noCursor();
  }

  if (flag1==2) {
    noCursor();
    //textSize(72);
    //text("an",width/2,height/2,100,100);
    fill(#43E4F5);
    //rect(200,200,800,800);
    //float b =random(50 , 150);
    txtSize = random(50, 150);
    flag = 0;
  }

  if (flag1 == 3) {
    fill( #F4F53E);
    ellipse(mouseX, mouseY, 40, 40);
    if (keyPressed) {
      flag1 = 0;
    }
  }

  if (flag1 == 4) {
    clear();
    flag1 = 0;
    flag = 0;
  }

  if (flag1 == 5) {
    sit = 1;
    flag1 = 0;
  }
  //println(flag1);
  //println(flag);
}

void textRotate() {
  pushMatrix();
  translate( width/2, height/2);
  rotate(radians(angleRate));
  fill(255);
  textSize(75);
  text(txt1, 0, 0);
  popMatrix();
  angleRate += 0.2;
}

void txtshow1() {
  String []txt ={"Type1", "Type2", "Type3", "Type4", "Type5", "Type6", "Type7", "Type8"};
  String []txt1 ={" ", "No Cursor ", "Cursor Get", "Clear", "Back"};
  for (int i =0; i< txt.length; i++) {
    fill(0);
    textSize(24);
    text(txt[i], 70, 210+(btHeight+10)*i, width, height);
  }
  for (int i =0; i< txt1.length; i++) {
    fill(0);
    textSize(28);
    text(txt1[i], 80+(btHeight*4-5)*i, 55, 200, 100);
  }
}

void canvas4() {
  //change2();
  button();
  txtshow1();
}


void change3() {
  noStroke();
  fill(#DD2D4A);
  rect(0, 0, width, height);
  fill(#FAF3E1);
  rect(width/10, height/10, width/10*8, height/10*8);
  stroke(#F2CBCE);
  strokeWeight(5);
  //rect(width/10*9+40, height/10, width/10, height/10*3.5);
  //rect(0, height/10, width/10-40, height/10*3.5);
  rect(0, height/10*5.5, width/10-40, height/10*3.5);
  if (mouseX<width && mouseX>width/10*9+40 &&mouseY<height && mouseY>height/10*5.5) {
    fill(#F2CBCE, 50);
    if (mousePressed) {
      sit = 1;
    }
  } else {
    fill(#FAF3E1);
  }
  rect(width/10*9+40, height/10*5.5, width/10, height/10*3.5);

  if (mouseX<width/10-40 && mouseX>0 &&mouseY>height/10 && mouseY<height/10*3.5 ) {
    fill(#F2CBCE, 50);
    if ( mousePressed) {
      fill(255);
      ellipse(500, 500, 50, 50);
      flag2 = flag2*-1;
    }
  } else {
    fill(#FAF3E1);
  }
  rect(0, height/10, width/10-40, height/10*3.5);



  if (mouseX>width/10*9+40 && mouseX < width && mouseY>height/10 && mouseY<height/10*3.5 ) {
    fill(#F2CBCE, 50);
    if ( mousePressed) {
      //fill(255);
      //ellipse(500, 500, 50, 50);
      flag3 = flag3*-1;
    }
  } else {
    fill(#FAF3E1);
  }
  rect(width/10*9+40, height/10, width/10, height/10*3.5);

  if (mouseX<width/10-40 && mouseX>0 &&mouseY>height/10*5.5 && mouseY<height ) {
    fill(#F2CBCE, 50);
    if ( mousePressed) {
      fill(255);
      ellipse(500, 500, 50, 50);
      flag4 = flag4*-1;
    }
  } else {
    fill(#FAF3E1);
  }
  rect(0, height/10*5.5, width/10-40, height/10*3.5);

  //println(flag2);
  String []txt = {"B", "a", "c", "k"};
  for (int i = 0; i < txt.length; i++) {
    fill(#DD2D4A);
    textSize(72);
    text(txt[i], width/10*9+90, height/10*5.5+85+90*i);
  }
}

void flowMountain() {
  if (flag2 == 1) {
    for (int i=0; i<layers.length; i++) {
      
      color col = lerpColor(cc1,cc2, 0.8-0.8/num*i);
      fill(col);
      layers[i].display();
      if(mousePressed && mouseX >width/10 && mouseX <width/10*9 && mouseY >height/10 && mouseY < height/10*9){
       randomColor();
      }
    }
    theta += TWO_PI/frames;
    fill(#DD2D4A);
    noStroke();
    rect(0, height/10*9, width, height/10);
  }
}

void randomColor(){
  float r = random(255);
  float g = random(255);
  float b = random(255);
  if(flag2 == 1){
  cc1 = color(r,g,b);
  cc2 = color(r,g-50,b);
  }
  
}

void flowDrops() {
  if (flag3 == 1) {
    for (int i = 0; i<500; i++) {
      drops[i].fall();
      drops[i].show();
      
      if(mouseX>0 && mouseX <width/10-40 && mouseY > height/10*5.5 &&mouseY <height/10*9 && mousePressed){
       drops[i] .colorChange();
      }
    }
    fill(#DD2D4A);
    noStroke();
    rect(0, height/10*9, width, height/10);
     rect(0, 0, width, height/10);
  }
}


void canvas5() {
  change3();
  flowMountain();
  flowDrops();
}


void change4() {
  fill(#D99CE0);
  rect(0, 0, width, height);
  if (mouseX<width && mouseX>width/10*9+40 &&mouseY<height && mouseY>height/10*5.5) {
    fill(#D9D4DB, 80);
    if (mousePressed) {
      sit = 1;
    }
  } else {
    fill(#D9D4DB);
  }
  rect(width/10*9+40, height/10*5.5, width/10, height/10*3.5);
  String []txt = {"B", "a", "c", "k"};
  for (int i = 0; i < txt.length; i++) {
    fill(#D99CE0);
    textSize(72);
    text(txt[i], width/10*9+90, height/10*5.5+85+90*i);
  }
}

void music() {
  fill(255, 80);
  rect(0, 0, width, height);
  voice = music.mix.level();
  noStroke();
  ellipse(width/2, height/2, voice*400*5, voice*400*5);
}

void canvas6() {
  change4();
  music();
}




/*for(int i = 0 ; i< num1 ;i++){
 color c1 = lerpColor(#C8C1CB,#DD2D4A,0.7-0.7/num1*i);
 fill(c1);
 mountains[i].display();
 }*/

/*
      // x1 = x1 * (noise(x1+nx, y1+ny)*0.5+0.5);
 //y1 = y1 * (noise(x1+nx, y1+ny)*0.5+0.5);
 //x1 = cos(angle)*(rad+(noise(x1+nx, y1+ny)*0.5+0.5));
 //y1 = sin(angle)*(rad+(noise(x1+nx, y1+ny)*0.5+0.5));
 float nn =  (noise(x1+nx*0.5, y1+ny*0.5)*0.5+0.5);
 x1 = cos(angle)*(1+nn)*rad;
 y1 = sin(angle)*(1+nn)*rad;
 */
 
 /* referrence
 https://zhuanlan.zhihu.com/p/43458894
 https://blog.csdn.net/Hewes/article/details/83479047
 http://www.ricardmarxer.com/geomerative/
 The Nature of Code
 https://www.bilibili.com/video/BV1Ck4y167ut?from=search&seid=17806176958274670137&spm_id_from=333.337.0.0
 
 ......*/
 
