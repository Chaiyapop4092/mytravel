class Destination {
  late String name;
  late String image;
  late String rate;
  late String location;

  Destination(this.name,this.image,this.rate,this.location);
}

List<Destination> destinations = [
  Destination("South Beach", "assets/images/travel_1.jpg", "5.0", "Zhong li, Taiwan"),
  Destination("Mountain Village", "assets/images/travel_2.jpg", "4.5", "Hu tao, Taiwan"),
  Destination("Sea Village", "assets/images/travel_3.jpg", "4.0", "Genshin, Taiwan"),
  Destination("Mountain River", "assets/images/travel_4.jpg", "3.5", "Tao dao, Taiwan"),
  Destination("River Village", "assets/images/travel_5.jpg", "3.0", "Lumine, Taiwan"),
  Destination("Mountain Hill", "assets/images/travel_6.jpg", "2.5", "Aether, Taiwan"),
  Destination("Capital Train", "assets/images/travel_7.jpg", "2.0", "Doe tou, Taiwan"),
  Destination("Waterfall", "assets/images/travel_8.jpg", "1.5", "Li pong, Taiwan"),
];