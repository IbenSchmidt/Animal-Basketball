Hand hand;
Ball ball;
Basket basket;
PImage basketBillede;
PImage basketballBillede;

Button start_btn;
Button shop_btn;

PImage bg;
PImage bgspil;
PImage bgshop;


String page = "start"; 

void setup() {
  basketBillede = loadImage("images/Basket2.png");
  basketballBillede = loadImage("images/Basketball.png");
  size(1100,900);
  frameRate(200);
  ball = new Ball(50);
  hand = new Hand();
  basket = new Basket(new PVector(225, 150), new PVector(15, 300));
  bgshop = loadImage("images/Shopskærm.png");
  bg = loadImage("images/background.png");
  bgspil = loadImage("images/Spilskærm.png");
  
  start_btn = new Button("game", new PVector(width/2 - 100, height/2 + 75), new PVector(176, 87));
  shop_btn = new Button("shop", new PVector(width/2 + 100, height/2 + 75), new PVector(176, 87));
}


void draw() {
  if (page == "start") {
    background(bg);
    start_btn.update();
    shop_btn.update();
  } else if (page == "shop") {
    start_btn.update();
    shop_btn.update();
    println("Du er ved shoppen");
    page = "start";
  } else if (page == "game") {
    background(bgspil);
    basket.update();
    ball.update(hand.pos, hand.force, hand.shoot);
    ball.collisionCheck(basket.size, basket.pos, basket.radius);
    hand.update(ball.reload);
    textSize(50);
    fill(0);
    text("Your points: "+ball.points,150,70);
    text("Highscore: "+ball.highscore,600,70);
  }
}
