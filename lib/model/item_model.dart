class Item {
  String id;
  String name;
  String quantity;

  Item({required this.id, required this.name, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
