import controlP5.*;
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

SQLite db;

ControlP5 cp5;

EnterButton login_button;
EnterButton signup_button;
EnterButton delete_button;

Hand hand;
Ball ball;
Basket basket;
PImage basketBillede;
PImage basketballBillede;

Button game_btn;
Button shop_btn;
Button info_btn;
Button start_btn;
Button delete_acc_btn;
Button dont_delete_btn;
Button worldrecord_btn;

Shop shop;

PImage bg;
PImage bgspil;
PImage bgshop;
PImage bginfo;

String user_id = "";
String username = "";
int all_available_points;

String page = "login";

void setup() {
  db = new SQLite(this, "mydatabase.sqlite");

  cp5 = new ControlP5(this);

  cp5.addTextfield("username")
     .setPosition((width/2)-100,180)
     .setSize(200,40)
     .setFocus(true)
     .setFont(createFont("arial", 25, true))
     .setColor(color(255));

  cp5.addTextfield("password")
     .setPosition((width/2)-100,280)
     .setSize(200,40)
     .setPasswordMode(true)
     .setFont(createFont("arial", 25, true))
     .setColor(color(255));

  //dette er signup knappen
  login_button = new EnterButton(new PVector((width/2)-185, 380), new PVector(174, 85), "login");
  signup_button = new EnterButton(new PVector((width/2), 380), new PVector(174, 85), "signup");
  delete_button = new EnterButton(new PVector((width/2), 680), new PVector(174, 85), "sletkonto");
  
  //Dette er hhv koordinater og størrelse på signin knappen
  //rect((width/2)+10,380,174,85);

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
  info_btn = new Button("info", new PVector(width/2 - 100, height/2 + 180), new PVector(176, 87));
  start_btn = new Button("start", new PVector(100, 50), new PVector(176, 87));
  delete_acc_btn = new Button("sletkonto", new PVector(width/2+100, height/2+180), new PVector(174, 85));
  dont_delete_btn = new Button("start", new PVector((width/2 - 100), 722), new PVector(174, 85));
  worldrecord_btn = new Button("worldrecord", new PVector((width/2),(height/2+285)), new PVector(376,87));
  
  // new PVector(100, 50), new PVector(100, 40));
}



void draw() {
  if (page == "login") {
    background(bgshop);
    if (db.connect()) {
      login_button.update();
      signup_button.update();
    }
  } else if (page == "start") {
    background(bg);
    textSize(30);
    fill(255);
    text("Hello " + username, 10, 50);
    game_btn.update();
    shop_btn.update();
    info_btn.update();
    delete_acc_btn.update();
    worldrecord_btn.update();
  } else if (page == "sletkonto") {
    // Yes or no
    background(bgshop);
    textSize(40);
    text("Er du sikker?", width/2-100, 450);
    delete_button.update();
    dont_delete_btn.update();
  } else if (page == "shop") {
    background(bgshop);
    shop.update();
  } else if (page == "worldrecord") {
    background(bgshop);
    start_btn.update();
    String sql_command = "SELECT * FROM users";
    db.query(sql_command);
    int max_highscore = 0;
    while (db.next()) {
      if (db.getInt("highscore") > max_highscore) {
        max_highscore = db.getInt("highscore"); 
      }
    }
    text(max_highscore, 100, 400);
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
