import 'package:flutter/material.dart';
import 'package:nextbook/src/config/app_data.dart' as appData;
import 'package:nextbook/src/pages/orders/components/order_tile.dart';


class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 203, 207),
        elevation: 0,
        title: const Text(
          'Pedidos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(height: 10),
          itemBuilder: (_, index) => OrderTile(order: appData.orders[index],),
          itemCount: appData.orders.length),
    );
  }
}
