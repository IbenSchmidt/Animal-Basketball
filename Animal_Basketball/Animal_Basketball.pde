Hand hand;
Ball ball;
Basket basket;
PImage basketBillede;
PImage basketballBillede;

void setup() {
  basketBillede = loadImage("Basket2.png");
  basketballBillede = loadImage("Basketball.png");
  loadImage("Butik.png");
  loadImage("Start.png");
  size(1100,900);
  frameRate(200);
  ball = new Ball(50);
  hand = new Hand();
  basket = new Basket(new PVector(225, 150), new PVector(15, 300));
}

void draw() {
  background(200);
  basket.update();
  hand.update(ball.reload);
  ball.update(hand.pos, hand.force, hand.shoot);
  ball.collisionCheck(basket.size, basket.pos, basket.radius);
  textSize(50);
  text("Your points: "+ball.points,25,75);
}
