class Hand {
  public float pos;
  PImage billede;
  public PVector force;
  float forceDisplay;
  boolean shoot = false;

  Hand() {
    billede = loadImage("images/Hånd1.png");
  }

  void updateHandImage(int billedeid_) {
    billede = loadImage("images/Hånd"+billedeid_+".png"); 
  }

  void update(boolean reload) {
    if (moveLeft && pos>0) {
      pos = pos-2;
    }
    if (moveRight && pos<width-100) {
      pos = pos+2;
    }
    if (reload) {
      shoot = false;
      force = new PVector (0, 0);
    }
    fill(255);
    image(billede,pos,height-100);
    //rect(pos, height-100, 50, 100);
  }

  void fire() {
    shoot = true;
    force = new PVector (0, -10);
  }
}
