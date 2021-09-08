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
    // Itere over shop items og tegn dem. 
    for (int i = 0; i < shopItems.size(); i++) {
      ShopItem shopItem = shopItems.get(i);
      if (i == cursor_item) {
        rect(width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500, imageSize * 1.1, imageSize*1.1);
      } else {
        rect(width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500, imageSize, imageSize);
      }
      textSize(30);
      text(shopItem.price, width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500 + imageSize + 75);
    }
  }
  
  void buyCurrentItem() {
    // println("Bought: " + shopItems.get(cursor_item).img_name);
    if (all_available_points >= shopItems.get(cursor_item).price) {
      all_available_points -= shopItems.get(cursor_item).price;
      hand.updateHandImage(int(shopItems.get(cursor_item).img_name));
      println(all_available_points + "----" + random(1));
    } else {
      println("No more points!!! " + random(1)); 
    }
  }
}

class ShopItem {
  public String img_name;
  public int price;

  ShopItem (String img_name_, int price_) {
    img_name = img_name_;
    price = price_;
  }
}
