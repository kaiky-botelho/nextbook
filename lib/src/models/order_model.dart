import 'cart_item_model.dart';

class OrderModel {
  final String id;
  final DateTime createdDateTime;
  final DateTime overdueDateTime;
  final List<CartItemModel> items;
  final String status;
  final String copyAndPaste;
  final double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}

