class Button {
  PVector pos;
  PVector size;
  String action;
  PImage image_;
  
  Button (String action_, PVector pos_, PVector size_) {
    action = action_;
    image_ = loadImage("images/" + action + ".png");
    pos = pos_;
    size = size_;
  }
  
  void update() {
    imageMode(CENTER);
    image(image_, pos.x, pos.y);
    
    // Check for tryk på knappen
    if (mousePressed == true) {
      boolean mouse_press_x = pos.x - size.x/2 < mouseX && mouseX < pos.x + size.x/2;
      boolean mouse_press_y = pos.y - size.y/2 < mouseY && mouseY < pos.y + size.y/2;
      if (mouse_press_x && mouse_press_y) {
        page = action;
        println(page);
      }
    }
    imageMode(CORNER);
  }
}
