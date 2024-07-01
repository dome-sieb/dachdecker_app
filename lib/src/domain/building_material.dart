class BuildingMaterial {
  String name;
  String details;
  String deliverytime;
  double price;
  double ordernumber;
  String certification;

  BuildingMaterial({
    required this.name,
    required this.details,
    required this.certification,
    required this.deliverytime,
    required this.ordernumber,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "details": details,
      "certification": certification,
      "deliverytime": deliverytime,
      "ordernumber": ordernumber,
      "price": price,
    };
  }

  factory BuildingMaterial.fromMap(Map<String, dynamic> map) {
    return BuildingMaterial(
      name: map["name"],
      details: map["details"],
      certification: map["certification"],
      deliverytime: map["deliverytime"],
      ordernumber: map["ordernumber"],
      price: map["price"],
    );
  }
  factory BuildingMaterial.eigtheen(
    String name,
    String details,
    String certification,
    String deliverytime,
    double ordernumber,
    double price,
  ) {
    return BuildingMaterial(
      name: name,
      details: details,
      certification: certification,
      deliverytime: deliverytime,
      ordernumber: ordernumber,
      price: price,
    );
  }
}
