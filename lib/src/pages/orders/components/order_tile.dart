import 'package:flutter/material.dart';
import 'package:nextbook/src/models/order_model.dart';
import 'package:nextbook/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  const OrderTile({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UtilsServices utilsServices = UtilsServices();
    
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID do Pedido: ${order.id}'),
            Text('Status: ${order.status}'),
            Text('Data de Entrega: ${order.overdueDateTime.toString()}'),
            const SizedBox(height: 10),
            ...order.items.map((cartItem) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cartItem.item.itemName),
                  Text('${utilsServices.princeToCurrency(cartItem.totalPrice())} (${cartItem.quantity} x ${utilsServices.princeToCurrency(cartItem.item.price)})'),
                ],
              );
            }).toList(),
            const SizedBox(height: 10),
            Text(
              'Total do Pedido: ${utilsServices.princeToCurrency(order.total)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
