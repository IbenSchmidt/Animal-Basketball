class Shop {
  ArrayList<ShopItem> shopItems = new ArrayList<ShopItem>();
  public int points = 0;

  public int cursor_item;
  
  int totalLength;
  int imageSize;
  int imageSpacing;

  Shop () {
    // Test items
    shopItems.add(new ShopItem("1", 10));
    shopItems.add(new ShopItem("2", 20));
    shopItems.add(new ShopItem("3", 30));
    shopItems.add(new ShopItem("4", 40));

    // Beregn størrelsen af hele "baren"
    imageSize = 150;
    imageSpacing = 25;
    totalLength = imageSize * shopItems.size() + imageSpacing * (shopItems.size() - 1);

    cursor_item = 0;
  }

  void update() {
    fill(255);
    textSize(30);
    text("Penge: " + all_available_points, 30,50);
    
    // Itere over shop items og tegn dem. 
    for (int i = 0; i < shopItems.size(); i++) {
      ShopItem shopItem = shopItems.get(i);
      image(shopItem.normal_img, width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500);
      if (i == cursor_item) {
        fill(0,0,100);
        textSize(40);
      } else {
        textSize(30);
      }
      text(shopItem.price, width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500 + imageSize + 75);
      fill(255);
    }
  }
  
  void buyCurrentItem() {
    // println("Bought: " + shopItems.get(cursor_item).img_name);
    if (all_available_points >= shopItems.get(cursor_item).price) {
      if (!hand.updateHandImage(
        int(shopItems.get(cursor_item).img_name),
        shopItems.get(cursor_item).price
      )) {
        text("Du ejer allerede denne genstand", 30, 100);
      }
      println(all_available_points + "----" + random(1));
    } else {
      println("No more points!!! " + random(1)); 
    }
  }
}

class ShopItem {
  public String img_name;
  public int price;
  public PImage normal_img;
  public PImage big_img;

  ShopItem (String img_name_, int price_) {
    img_name = img_name_;
    price = price_;
    normal_img = loadImage("images/Hånd"+img_name+".png");
    big_img = loadImage("images/Hånd"+img_name+".png");
  }
}
