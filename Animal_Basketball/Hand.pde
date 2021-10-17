class Hand {
  public float pos;
  PImage billede;
  String billedeid;
  public PVector force;
  float forceDisplay;
  boolean shoot = false;

  Hand() {
    billedeid = "1";
    billede = loadImage("images/Hånd1.png");
  }

  boolean buyHand(String img_name, int price) {
    if (bought_hands.contains(img_name)) {
      updateHandImage(img_name);
    } else if (all_available_points >= price) {
      all_available_points -= price;
      bought_hands += "_" + img_name;
      updateHandImage(img_name);
      
      String sql_command = "UPDATE users SET hands_ = '"+ bought_hands + "' WHERE username = '" + username +"'";
      db.execute(sql_command);
    } else {
      return false;
    }
    return true;
  }

  void updateHandImage(String billedeid_) {
    billedeid = billedeid_; // Opdatere sådan at man kan se hvilken hånd der er aktiv
    billede = loadImage("images/Hånd"+billedeid_+".png");
  }
  
  boolean __updateHandImage(String billedeid_, int price) {
    if (billedeid != billedeid_) {
      all_available_points -= price;
      billedeid = billedeid_;
      billede = loadImage("images/Hånd"+billedeid_+".png");
      return true;
    }
    return false;
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
    image(billede, pos, height-100);
    //rect(pos, height-100, 50, 100);
  }

  void fire() {
    shoot = true;
    force = new PVector (0, -10);
  }
}
