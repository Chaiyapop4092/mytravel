class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name,this.image,this.rate,this.location);
}

List<Destination> destinations = [
  Destination("NAME1", "assets/images/travel_1.jpg", "5.0", "Zhong li, Taiwan"),
  Destination("NAME2", "assets/images/travel_2.jpg", "4.5", "Hu tao, Taiwan"),
  Destination("NAME3", "assets/images/travel_3.jpg", "4.0", "Genshin, Taiwan"),
  Destination("NAME4", "assets/images/travel_4.jpg", "3.5", "Tao dao, Taiwan"),
  Destination("NAME5", "assets/images/travel_5.jpg", "3.0", "Lumine, Taiwan"),
  Destination("NAME6", "assets/images/travel_6.jpg", "2.5", "Aether, Taiwan"),
  Destination("NAME7", "assets/images/travel_7.jpg", "2.0", "Doe tou, Taiwan"),
  Destination("NAME8", "assets/images/travel_8.jpg", "1.5", "Li pong, Taiwan"),
];