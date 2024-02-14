class Product {
  double price;
  String img;
  String title;
  String suptitle;

  Product(this.img, this.price, this.title, this.suptitle);
}

List<Product> product = [
  Product("images/png-clipartpart.png", 6, "Ball joint", "front uper arm"),
  Product("images/png-transparent.png", 4, "Alignment Caster / Camber Bushing",
      "Front Upper"),
  Product("images/pngparts.png", 8, "Coil Spring", "Front Left"),
  Product("images/4.jpg", 3, "Control Arm", " Front Left Upper"),
  Product("images/5.jpg", 6, "Shock / Strut", " Rear 4WD"),
  Product("images/6.jpg", 2, "Ball joint", "front uper arm"),
  Product("images/7.jpg", 4.5, "Sway Bar Link", "rear"),
  Product("images/8.jpg", 6.5, "Sway Bar Link", "front"),
];
