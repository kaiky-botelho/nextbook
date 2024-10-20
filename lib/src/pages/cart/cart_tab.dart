import 'package:flutter/material.dart';
import 'package:nextbook/src/config/custom_colors.dart';
import 'package:nextbook/src/models/cart_item_model.dart';
import 'package:nextbook/src/pages/cart/components/cart_tile.dart';
import 'package:nextbook/src/services/utils_services.dart';
import 'package:nextbook/src/config/app_data.dart' as appData;
import 'package:nextbook/src/models/order_model.dart'; // Import do OrderModel

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();
  final TextEditingController _paymentMethodController =
      TextEditingController(text: 'Pix');

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
                        await showAddressForm();
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

  Future<void> showAddressForm() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Endereço de Entrega'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'CEP',
                  ),
                ),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Endereço',
                  ),
                ),
                TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Número',
                  ),
                ),
                TextField(
                  controller: _bairroController,
                  decoration: const InputDecoration(
                    labelText: 'Bairro',
                  ),
                ),
                TextField(
                  enabled: false,
                  controller: _paymentMethodController,
                  decoration: const InputDecoration(
                    labelText: 'Forma de Pagamento',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                processOrder();
                Navigator.of(context).pop();

                // Adiciona um SnackBar para informar o usuário
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Pedido confirmado com sucesso!'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  void processOrder() {
    // Simula o cálculo do frete com base no CEP
    String cep = _cepController.text;
    double shippingCost = 0;

    if (cep.isNotEmpty) {
      // Exemplo fictício de cálculo de frete
      shippingCost = double.parse(cep.substring(cep.length - 3)) * 0.1;
    }

    // Cria um novo pedido (OrderModel)
    final newOrder = OrderModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Gera um ID único
      createdDateTime: DateTime.now(),
      overdueDateTime: DateTime.now().add(const Duration(days: 5)), // Simula um prazo
      items: List.from(appData.cartItems), // Copia os itens do carrinho
      status: 'pendente_pagamento', // Status inicial do pedido
      copyAndPaste: 'abc123pixcode', // Código Pix fictício
      total: cartTotalPrice() + shippingCost, // Total do pedido com frete
    );

    // Adiciona o novo pedido à lista de pedidos
    appData.orders.add(newOrder);

    // Limpa o carrinho após o pedido ser finalizado
    appData.cartItems.clear();
  }
}
