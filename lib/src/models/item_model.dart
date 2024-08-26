class ItemModel {
  String itemName;
  String imgUrl;
  double price;
  String unit;
  String condition;
  String description;
  String category; // Novo campo

  ItemModel({
    required this.itemName,
    required this.imgUrl,
    required this.price,
    required this.unit,
    required this.condition,
    required this.description,
    required this.category, // Novo campo
  });
}
