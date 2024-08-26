import 'package:flutter/material.dart';
import 'package:nextbook/src/config/custom_colors.dart';
import 'package:nextbook/src/models/cart_item_model.dart';
import 'package:nextbook/src/pages/cart/components/cart_tile.dart';
import 'package:nextbook/src/services/utils_services.dart';
import 'package:nextbook/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final hasItems = appData.cartItems.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 203, 207),
        elevation: 0,
        title: const Text(
          'Carrinho',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: hasItems
                ? ListView.builder(
                    itemCount: appData.cartItems.length,
                    itemBuilder: (_, index) {
                      return CartTile(
                        cartItem: appData.cartItems[index],
                        remove: (item) {
                          setState(() {
                            appData.cartItems.remove(item);
                          });
                        },
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'Seu carrinho está vazio.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
          ),
          if (hasItems)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Total Geral',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    utilsServices.princeToCurrency(cartTotalPrice()),
                    style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.vermelhoNext,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.vermelhoNext,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () async {
                        bool? result = await showOrderConfirmation();

                        if (result == true) {
                          // Proceed with order submission
                          // Add your order submission logic here
                        }
                      },
                      child: const Text(
                        'Concluir Pedido',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in appData.cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmação'),
          content: const Text("Deseja realmente concluir o pedido?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
