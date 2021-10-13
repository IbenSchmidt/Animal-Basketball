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
    image_ = loadImage("images/start.png");
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
        String username = cp5.get(Textfield.class, "username").getText();
        String password = cp5.get(Textfield.class, "password").getText();

        // tilføj sql og database kode
        if (action == "login") {
          // hash password
          String hashed_password = hashText(password);

          // Look up in database
          String sql_command = "SELECT * FROM login WHERE username='" + username + "' AND password='" + hashed_password + "';"; 
          db.query(sql_command);
          if (!db.next()) {
            error_messages.add("Burgernavn eller adgangskode eksisterer ikke");
          }
        } else if (action == "signup") {
          // Check hvis password er korrekt form
          // Check hvis brugernavn eksisterer
        }
        
        if (error_messages.size() == 0) {
          run_login_command(); 
        }
      }
    }
    imageMode(CORNER);
  }

  void run_login_command() {
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
