class Letter1 {
  char letter ;
  float x0, y0;
  float x, y;
  float theta;
  
  //float a;

  Letter1(float x_, float y_, char letter_) {
    x0 = x_;
    y0 = y_;
    letter = letter_;
    theta = random(TWO_PI);
    x = random(100,width);
    y = random(100 , height);
  }

  void display() {
    fill(0);
    textAlign(LEFT);
    pushMatrix();
    translate(x , y);
    rotate(theta);
    text(letter, x, y);
    popMatrix();
  }

  void shake () {
    float speed;
    speed = map(dist(x , y , width/2 ,height/2 ),0 , 500 , 8 , -2);
    x += speed/2;
    y += speed/2;
    if(x < width-100 && x > 100 && y < height - 100 && y > 100){
      speed = speed * -1;
    }
  }
  void origin(){
    x = lerp(x, x0, 0.04);
    y = lerp(y, y0, 0.04);
    theta = lerp(theta, 0, 0.04);
    
  }
}
