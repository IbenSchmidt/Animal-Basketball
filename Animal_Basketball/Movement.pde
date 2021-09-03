boolean moveLeft,moveRight;
boolean handIsLoaded = false;

void keyPressed(){
  if (keyCode=='A'){
    moveLeft = true;
  }
  if (keyCode=='D'){
    moveRight = true;
  }
  if (keyCode==' ' && ball.attachedToHand){
    handIsLoaded = true;
  }
}

void keyReleased(){
  if (keyCode=='A'){
    moveLeft = false;
  }
  if (keyCode=='D'){
    moveRight = false;
  }
  if (keyCode==' ' && handIsLoaded){
    handIsLoaded = false;
    hand.fire();
  }
}
