import 'item_model.dart';

class CartItemModel {
  final ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    this.quantity = 1,
  });

  double totalPrice() {
    return item.price * quantity;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
