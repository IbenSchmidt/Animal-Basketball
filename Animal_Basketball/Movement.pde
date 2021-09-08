boolean moveLeft, moveRight;
boolean handIsLoaded = false;

void keyPressed() {
  if (keyCode=='A') {
    moveLeft = true;
  }
  if (keyCode=='D') {
    moveRight = true;
  }
  if (keyCode==' ' && ball.attachedToHand) {
    handIsLoaded = true;
  }
}

void keyReleased() {
  if (keyCode=='A') {
    moveLeft = false;
  }
  if (keyCode=='D') {
    moveRight = false;
  }
  if (keyCode==' ' && handIsLoaded) {
    handIsLoaded = false;
    hand.fire();
  }
  
  if(page == "shop" && keyCode == ENTER){
    shop.buyCurrentItem();
  }
  
  if (page == "shop" && keyCode == RIGHT) {
    shop.cursor_item++;
    if (shop.cursor_item == shop.shopItems.size()) {
      shop.cursor_item = 0; 
    }
  }
  if (page == "shop" && keyCode == LEFT) {
    shop.cursor_item--;
    if (shop.cursor_item == 0) {
      shop.cursor_item = shop.shopItems.size();
    }
  }
  
  if (page == "shop" && keyCode == BACKSPACE) {
    page = "start";
  }
}
