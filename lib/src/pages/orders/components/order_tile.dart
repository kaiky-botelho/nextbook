import 'package:flutter/material.dart';
import 'package:nextbook/src/config/custom_colors.dart';
import 'package:nextbook/src/models/order_model.dart';
import 'package:nextbook/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  OrderTile({
    super.key,
    required this.order,
  });

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${order.id}',
                style: TextStyle(color: CustomColors.vermelhoNext),
              ),
              FutureBuilder<String>(
                future: utilsServices.formatDateTime(order.createdDateTime),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      'Carregando...',
                      style: TextStyle(fontSize: 12),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Erro ao carregar data',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    );
                  } else {
                    return Text(
                      snapshot.data ?? '',
                      style: TextStyle(fontSize: 12),
                    );
                  }
                },
              ),
            ],
          ),
          children: [],
        ),
      ),
    );
  }
}
