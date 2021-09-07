
class Basket {
  PVector size;
  PVector pos;
  PVector speed = new PVector(1, 0);
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
    pos.add(speed);
    if (pos.x+size.x>width ||pos.x<0) {
      speed.mult(-1);
    }
    
  }
}
