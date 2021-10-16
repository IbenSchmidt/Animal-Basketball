class Button {
  PVector pos;
  PVector size;
  String action;
  PImage image_;

  Button (String action_, PVector pos_, PVector size_) {
    action = action_;
    image_ = loadImage("images/" + action + ".png");
    pos = pos_;
    size = size_;
  }

  void update() {
    imageMode(CENTER);
    image(image_, pos.x, pos.y);

    // Check for tryk på knappen
    if (mousePressed == true) {
      boolean mouse_press_x = pos.x - size.x/2 < mouseX && mouseX < pos.x + size.x/2;
      boolean mouse_press_y = pos.y - size.y/2 < mouseY && mouseY < pos.y + size.y/2;
      if (mouse_press_x && mouse_press_y) {
        page = action;
        message = "";
      }
    }
    imageMode(CORNER);
  }
}

class EnterButton {
  PVector pos;
  PVector size;
  String action;
  PImage image_;

  ArrayList<String> error_messages = new ArrayList<String>();

  EnterButton (PVector pos_, PVector size_, String action_) {
    image_ = loadImage("images/"+action_+".png");
    pos = pos_;
    size = size_;
    action = action_;
  }

  void update() {
    image(image_, pos.x, pos.y);

    // Check for tryk på knappen
    if (mousePressed == true) {
      boolean mouse_press_x = pos.x < mouseX && mouseX < pos.x + size.x;
      boolean mouse_press_y = pos.y < mouseY && mouseY < pos.y + size.y;
      if (mouse_press_x && mouse_press_y) {
        String username = ""; 
        String password = "";
        String hashed_password = "";
        try {
          username = cp5.get(Textfield.class, "username").getText();
          password = cp5.get(Textfield.class, "password").getText();
          // hash password
          hashed_password = hashText(password);
        } catch (Exception e) {}

        error_messages = new ArrayList<String>();

        // tilføj sql og database kode
        if (action == "login") {
          // Look up in database
          String sql_command = "SELECT * FROM users WHERE username='" + username + "' AND password='" + hashed_password + "';"; 
          db.query(sql_command);
          if (!db.next()) {
            error_messages.add("Burgernavn eller adgangskode eksisterer ikke");
          }
        } else if (action == "signup") {
          // Check hvis password er korrekt form
          if (match(password, "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$") == null){
            error_messages.add("Adgangskoden skal have minimum 8 tegn, et tal, et specielt tegn og et stort bogstav");
          }
          
          // Check hvis brugernavn eksisterer
          String sql_command = "SELECT * FROM users WHERE username='" + username + "';";
          db.query(sql_command);
          if (db.next()) {
            error_messages.add("Brugernavnet eksisterer allerede");
          }
        } else if (action == "sletkonto") {
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          String sql_command = "DELETE FROM users WHERE username='"+user_id+"';";
          println(sql_command);
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          println("........................................................");
          db.execute(sql_command);
        }
        
        
        if (error_messages.size() == 0) {
          if (action == "signup") {
            String sql_command = "INSERT INTO users (username, password, highscore, all_available_points) VALUES ('" + username + "', '" + hashed_password + "', 0, 0)";
            db.execute(sql_command);
            run_login_command(username);
          } else if (action == "login") {
            run_login_command(username);
          } else if (action == "sletkonto") {
            println("........................................................");
            page = "login"; 
          }
        }
      }
    }

    int iter = 0;
    fill(255, 0,0);
    for (String i : error_messages) {
      iter += 1;
      text(i, 10, 10 + (iter*40));
    }
    fill(255);
    imageMode(CORNER);
  }

  void run_login_command(String uname) {
    String sql_command = "SELECT * FROM users WHERE username='"+uname+"';";
    db.query(sql_command);
    
    // Ekstraher pengene og andre værdier
    user_id = db.getString("username");
    username = db.getString("username");
    ball.highscore=db.getInt("highscore");
    all_available_points=db.getInt("all_available_points");
    
    cp5.remove("username");
    cp5.remove("password");
    page = "start";
  }
}

class BuyButton {
  PVector pos;
  PVector btnColor;
  String action;
  PVector size;
  ShopItem item;

  boolean canBuy = true;

  BuyButton (ShopItem item_, PVector color_, PVector pos_) {
    item = item_;
    pos = pos_;
    btnColor = color_;
    size = new PVector(100, 70);

    if (int(item_.img_name) == 1) {
      canBuy = false;
    }
  }

  void update() {
    rectMode(CENTER);
    if (canBuy) {
      fill(btnColor.x, btnColor.y, btnColor.z);
    } else {
      fill(0, 255, 255);
    }
    rect(pos.x, pos.y, size.x, size.y);
    textSize(20);
    fill(0);
    text("Køb for: \n" + item.price, pos.x-45, pos.y-10);


    // Check for tryk på knappen
    if (mousePressed == true) {
      boolean mouse_press_x = pos.x - size.x/2 < mouseX && mouseX < pos.x + size.x/2;
      boolean mouse_press_y = pos.y - size.y/2 < mouseY && mouseY < pos.y + size.y/2;
      if (mouse_press_x && mouse_press_y && canBuy) {
        if (mousePressed && mouseButton == LEFT) { 
          // Bought item
          if (shop.buyCurrentItem(item)) {
            message = "Du har nu købt en hånd";
            canBuy = false;
          }
        }
      }
    }
    imageMode(CORNER);
  }
}
