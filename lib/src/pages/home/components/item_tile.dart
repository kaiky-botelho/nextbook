import 'package:flutter/material.dart';
import 'package:nextbook/src/config/custom_colors.dart';
import 'package:nextbook/src/models/item_model.dart';
import 'package:nextbook/src/pages/product/product_sreen.dart';
import 'package:nextbook/src/services/utils_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    super.key,
    required this.item,
  });

  final ItemModel item;
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) {
              return ProductSreen(item: item);
            }));
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // imagem
                  Expanded(
                    child: Hero(
                      tag: item.imgUrl,
                      child: Image.asset(item.imgUrl),
                    ),
                  ),
                  // Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Preco
                  Text(
                    utilsServices.princeToCurrency(item.price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.vermelhoNext,
                    ),
                  ),

                  // Condição
                  Text(
                    'Estado: ${item.condition}',
                    style: TextStyle(
                      color: CustomColors.escuroNext,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                  color: CustomColors.vermelhoNext,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ))
      ],
    );
  }
}
