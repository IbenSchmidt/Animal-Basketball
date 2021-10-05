import controlP5.*;

ControlP5 cp5;

EnterButton enter_button;

Hand hand;
Ball ball;
Basket basket;
PImage basketBillede;
PImage basketballBillede;

Button game_btn;
Button shop_btn;
Button info_btn;
Button start_btn;

Shop shop;

PImage bg;
PImage bgspil;
PImage bgshop;
PImage bginfo;

int all_available_points;

String page = "login";

void setup() {
  cp5 = new ControlP5(this);

  cp5.addTextfield("username")
     .setPosition(20,100)
     .setSize(200,40)
     .setFocus(true)
     .setColor(color(255));
     
  cp5.addTextfield("password")
     .setPosition(20,170)
     .setSize(200,40)
     .setPasswordMode(true)
     .setColor(color(255));
  
  enter_button = new EnterButton(new PVector(20, 240), new PVector(176, 87));
  
  all_available_points = 0;

  basketBillede = loadImage("images/Basket2.png");
  basketballBillede = loadImage("images/Basketball.png");
  size(1100, 900);
  frameRate(200);
  ball = new Ball(50);
  hand = new Hand();
  basket = new Basket(new PVector(225, 150), new PVector(15, 300));

  shop = new Shop();

  bg = loadImage("images/background1.png");
  bgspil = loadImage("images/Spilskærm.png");
  bgshop = loadImage("images/Shopskærm.png");
  bginfo = loadImage("images/Controls.png");

  game_btn = new Button("game", new PVector(width/2 - 100, height/2 + 75), new PVector(176, 87));
  shop_btn = new Button("shop", new PVector(width/2 + 100, height/2 + 75), new PVector(176, 87));
  info_btn = new Button("info", new PVector(width/2, height/2 + 180), new PVector(176, 87));
  start_btn = new Button("start", new PVector(100, 50), new PVector(176, 87));
  // new PVector(100, 50), new PVector(100, 40));
}



void draw() {
  if (page == "login") {
    background(0);
    enter_button.update();
  } else if (page == "start") {
    background(bg);
    game_btn.update();
    shop_btn.update();
    info_btn.update();
  } else if (page == "shop") {
    background(bgshop);
    shop.update();
  } else if (page == "info") {
    background(bginfo);
    start_btn.update();
  } else if (page == "game") {
    background(bgspil);
    basket.update();
    ball.update(hand.pos, hand.force, hand.shoot);
    ball.collisionCheck(basket.size, basket.pos, basket.radius);
    hand.update(ball.reload);
    textSize(50);
    fill(0);
    text("Your points: "+ball.points, 150, 70);
    text("Highscore: "+ball.highscore, 600, 70);
  }
}
