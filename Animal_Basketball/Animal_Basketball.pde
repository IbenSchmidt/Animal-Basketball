Hand hand;
Ball ball;

void setup(){
  size(1100,900);
  frameRate(200);
  ball = new Ball(50);
  hand = new Hand();
}

void draw(){
  background(200);
  hand.update(ball.reload);
  ball.update(hand.pos, hand.force, hand.shoot);
}
