class Button {
  PVector pos;
  PVector size;
  String action;
  
  Button (String action_, PVector pos_, PVector size_) {
    action = action_;
    pos = pos_;
    size = size_;
  }
  
  // 174 85
  void update() {
    rectMode(CENTER);
    rect(pos.x, pos.y, size.x, size.y);
    
    // Check for tryk på knappen
    if (mousePressed == true) {
      if (pos.x - size.x/2 < mouseX && mouseX < pos.x + size.x/2) {
        page = "game";
        println(page);
      }
    }
    rectMode(CORNER);
  }
}
