PVector gravity = new PVector(0, 0.1);

class Ball {
  PVector pos;
  PVector force;
  int radius;
  public boolean attachedToHand;
  public boolean reload;
  boolean ableToScore = true;
  public int points;
  public int totalPoints;
  public int highscore;

  Ball(float posX) {
    pos = new PVector(posX, height-112.5);
    radius = 50;
    attachedToHand = true;
  }

  void update(float posX, PVector force_, boolean shoot) {
    if (shoot) {
      force = force_;
      attachedToHand = false;
    }
    if (!attachedToHand) {
      force.add(gravity);
      pos.add(force);
    } else {
      pos.x = posX+25;
      pos.y = height-100;
    }
    reload = false;
    if (pos.y>height-12.5) {
      if(ableToScore){
        page = "start";
        totalPoints = totalPoints + points;
        points=0;
        basket.pos.y=300;
        // åbn er database fil, og skriv hvor mange point der er i alt
      }
      
      attachedToHand=true;
      reload = true;
      ableToScore = true;
      
    }
    fill(238, 103, 48);
    circle(pos.x, pos.y, radius);
    image(basketballBillede,pos.x-25,pos.y-25);
    if(points>highscore){
          highscore=points;
        }
  }

  void collisionCheck(PVector basket_size, PVector basket_pos, float basket_radius) {
    PVector basket_center = new PVector(basket_pos.x + basket_size.x / 2, basket_pos.y + basket_size.y / 2);

    // hvis distancen mellem basket_center og bolden er mindre end r, tæl som ramt
    float dist = sq(basket_center.x - pos.x) + sq(basket_center.y - pos.y);
    if (sqrt(dist) < basket_radius && ableToScore) {
      ableToScore = false;
      points = points + 1;
      println(points);
    }
  }
}
