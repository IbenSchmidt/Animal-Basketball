PVector gravity = new PVector(0,0.1);

class Ball{
  PVector pos;
  PVector force;
  int radius;
  public boolean attachedToHand;
  public boolean reload;
  
  Ball(float posX){
    pos = new PVector(posX,height-112.5);
    radius = 25;
    attachedToHand = true;
  }
  
  void update(float posX, PVector force_, boolean shoot){
    if (shoot){
      force = force_;
      attachedToHand = false;
    }
    if (!attachedToHand){
      force.add(gravity);
      pos.add(force);
    } 
    else {
      pos.x = posX+50;
      pos.y = height-112.5;
    }
    reload = false;
    if (pos.y>height-12.5){
      attachedToHand=true;
      reload = true;
      
    }
    fill(238,103,48);
    circle(pos.x,pos.y,radius);
  }
}
