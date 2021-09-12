String message = "";

class Shop {
  ArrayList<ShopItem> shopItems = new ArrayList<ShopItem>();
  ArrayList<BuyButton> buyButtons = new ArrayList<BuyButton>();
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

    for (int i = 0; i < shopItems.size(); i++) {
      PVector buttonPos = new PVector(width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500 + imageSize + 75);
      buyButtons.add(new BuyButton(shopItems.get(i), new PVector(100, 255, 100), buttonPos));
    }
  }

  void update() {
    fill(255);
    textSize(30);

    start_btn.update();
    text("Penge: " + all_available_points, 30, 150);
    text(message, 30, 200);

    // Itere over shop items og tegn dem. 
    for (int i = 0; i < shopItems.size(); i++) {
      ShopItem shopItem = shopItems.get(i);
      BuyButton buyButton = buyButtons.get(i);
      image(shopItem.normal_img, width/2 - totalLength/2 + i*(imageSize+imageSpacing), 500);
      buyButton.update();
      fill(255);
    }
  }

  boolean buyCurrentItem(ShopItem item) {
    if (all_available_points >= item.price) {
      if (!hand.updateHandImage(int(item.img_name), item.price)) {
        message = "Du ejer allerede denne genstand";
        return false;
      }
      message = "Købt genstand";
      return true;
    }
    message = "Du har ikke nok penge";
    return false;
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
