
class Basket {
  PVector size;
  PVector pos;
  PVector speed = new PVector(1, 1);
  int radius = 60;
  boolean ableToScore;

  Basket(PVector size_, PVector pos_) {
    size=size_;
    pos=pos_;
  }

  void update() {
    fill(0, 255, 0);
    //rect(pos.x, pos.y, size.x, size.y);
    circle(pos.x+size.x/2, pos.y+size.y/2, radius*2);
    image(basketBillede,pos.x,pos.y);
    
    if (ball.points<10){
      pos.x+=speed.x;
    }
    else if(ball.points>=10&&ball.points<25){
      pos.add(speed);
    }
    else if(ball.points>=25){
      pos.add(speed);
      pos.add(speed);
    }
    
    if (pos.x+size.x>width ||pos.x<0) {
      speed.x=speed.x*-1;
    }
    if (pos.y+size.y>600||pos.y<150){
      speed.y=speed.y*-1;
    }
    
  }
}
