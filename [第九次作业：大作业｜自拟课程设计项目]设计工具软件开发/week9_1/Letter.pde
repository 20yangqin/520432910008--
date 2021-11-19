class Letter {
  char letter ;
  float x0, y0;
  float x, y;
  
  //float a;

  Letter(float x_, float y_, char letter_) {
    x0 = x_;
    y0 = y_;
    letter = letter_;
  }

  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter, x, y);
  }

  void shake () {
    x += random(-4, 4);
    y += random(-4, 4);
  }
  
  void origin(){
   x = x0;
   y = y0;
    
  }
}
