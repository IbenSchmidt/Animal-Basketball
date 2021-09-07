Hand hand;
Ball ball;
Basket basket;
PImage basketBillede;
PImage basketballBillede;

Button start_btn;
Button shop_btn;

PImage bg;

String page = "start"; 

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
  
  bg = loadImage("images/background.png");
  
  start_btn = new Button("game", new PVector(width/2, height/2), new PVector(100, 50));
  shop_btn = new Button("shop", new PVector(width/2, height/2 + 75), new PVector(100, 50));
}


void draw() {
  image(bg,0,0);  
  if (page == "start") {
    
    start_btn.update();
    shop_btn.update();
  } else if (page == "shop") {
    start_btn.update();
    shop_btn.update();
    println("Du er ved shoppen");
    page = "start";
  } else if (page == "game") {
    basket.update();
    hand.update(ball.reload);
    ball.update(hand.pos, hand.force, hand.shoot);
    ball.collisionCheck(basket.size, basket.pos, basket.radius);
    textSize(50);
    text("Your points: "+ball.points,25,75);
  }
}
