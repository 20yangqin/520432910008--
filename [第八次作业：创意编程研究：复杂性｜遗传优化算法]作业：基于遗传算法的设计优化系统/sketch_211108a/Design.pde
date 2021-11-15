class Design {

  DNA dna;
  float fitness;
  float x, y;
  int wh = 200;
  boolean rolloverOn;
  float chooseOutline = random(0, 1);
  float chooseDrops = random(0, 1);
  float chooseColor = random(0, 1);
  Rectangle r;

  // Create a new Design
  Design(DNA dna_, float x_, float y_) {
    dna = dna_;
    x = x_;
    y = y_;

    fitness = 1;

    r = new Rectangle(int(x), int(y), int(wh), int(wh));
  }

  void display() {

    pushMatrix();
    translate(x, y);
    noStroke();

    if (rolloverOn) fill(0, 0.25);
    else noFill();

    // Draw the monster

    int aa = 100;
    int x1 = 80;
    int y1 = 80;


    if (chooseOutline<0.3) {
       fill(dna.genes[1], dna.genes[2], dna.genes[3]);
      rect(x1-20, y1-20, aa/3, aa/3);
      rect(x1+35, y1-20, aa/3, aa/3);
      ellipse( x1+25, y1, 70, 70);
    } else if (chooseOutline >=0.3 && chooseOutline <0.6) {
       fill(dna.genes[4], dna.genes[5], dna.genes[6]);
      rect(x1, y1-30, aa/2, aa/2);
      rect(x1-20, y1-20, aa/3, aa/3);
      rect(x1+35, y1-20, aa/3, aa/3);
    } else {
      fill(dna.genes[7], dna.genes[8], dna.genes[9]);
      ellipse(x1, y1, 40, 40);
      ellipse(x1 +25, y1, 70, 70);
      ellipse(x1+60, y1, 30, 30);
    }



    if (chooseColor < 0.3) {
      fill(dna.genes[1], dna.genes[2], dna.genes[3]);
    } else if (chooseColor >=0.3 && chooseColor < 0.6) {
      fill(dna.genes[4], dna.genes[5], dna.genes[6]);
    } else {
      fill(dna.genes[7], dna.genes[8], dna.genes[9]);
    }
    if (chooseDrops < 0.3) {
      rect(x1-15, y1+40, 10, 30);
      rect(x1+30, y1+70, 10, 40);
      rect(x1+10, y1+60, 10, 30);
      rect(x1+55, y1+50, 10, 25);
    } else if (chooseDrops > 0.3 && chooseDrops < 0.6) {
      ellipse(x1-15, y1+40, 10, 10);
      ellipse(x1+30, y1+70, 20, 20);
      ellipse(x1+55, y1+50, 10, 10);
      ellipse(x1, y1+55, 10, 10);
      ellipse(x1+10, y1+90, 15, 15);
    } else {
      rect(x1-15, y1+40, 10, 10);
      rect(x1-5, y1+70, 10, 10);
      rect(x1+10, y1+80, 20, 20);
      rect(x1+55, y1+50, 25, 25);
    }


    popMatrix();

    textAlign(CENTER);
    if (rolloverOn) fill(0);
    else fill(0.25);
    text(int(fitness), x+wh/2, y+wh+20);
  }

  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  boolean clickedOn;
  boolean clicked(int mx, int my) {
    if (r.contains(mx, my)) clickedOn = true;
    return clickedOn;
  }

  void rollover(int mx, int my) {
    if (r.contains(mx, my)) {
      rolloverOn = true;
      if (mousePressed) {
        fitness += 0.25;
      }
    } else {
      rolloverOn = false;
    }
  }
}
