Hand hand;
Ball ball;
Basket basket;

Button start_btn;

String page = "start"; 

void setup() {
  size(1100,900);
  frameRate(200);
  ball = new Ball(50);
  hand = new Hand();
  basket = new Basket(new PVector(225, 150), new PVector(15, 300));
  
  start_btn = new Button("start", new PVector(width/2, height/2), new PVector(100, 50));
}


void draw() {
  background(200);
  if (page == "start") {
    start_btn.update();
  } else if (page == "game") {
    basket.update();
    hand.update(ball.reload);
    ball.update(hand.pos, hand.force, hand.shoot);
    ball.collisionCheck(basket.size, basket.pos, basket.radius);
    textSize(50);
    text("Your points: "+ball.points,25,75);
  }
}
