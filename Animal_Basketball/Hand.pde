class Hand{
  public float pos;
  int billedeid;
  public PVector force;
  float forceDisplay;
  boolean shoot = false;
  
  Hand(){
    
  }
  
  void update(boolean reload){
    if (moveLeft && pos>0){
      pos = pos-2;
    }
    if (moveRight && pos<width-100){
      pos = pos+2;
    }
    if (reload){
      shoot = false;
      force = new PVector (0,0);
    }
    fill(255);
    rect(pos, height-100, 100, 100);
  }
  
  void fire(){
    shoot = true;
    force = new PVector (0,-10);
  }
}
