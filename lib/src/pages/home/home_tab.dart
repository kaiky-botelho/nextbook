import 'package:flutter/material.dart';
import 'package:nextbook/src/models/item_model.dart';
import 'package:nextbook/src/pages/home/components/category_tile.dart';
import 'package:nextbook/src/config/app_data.dart' as appData;
import 'package:nextbook/src/pages/home/components/item_tile.dart';
import 'package:nextbook/src/models/cart_item_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Romance';

  // ValueNotifier to keep track of cart item count
  final ValueNotifier<int> _cartItemCount = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    // Initialize the cart item count
    _updateCartItemCount();
  }

  void _updateCartItemCount() {
    _cartItemCount.value = appData.cartItems.length;
  }

  void _addToCart(ItemModel item) {
    setState(() {
      // Add the item to the cart
      appData.cartItems.add(CartItemModel(item: item, quantity: 1));
      _updateCartItemCount();
    });
  }

  List<ItemModel> getFilteredItems() {
    if (selectedCategory == 'Todos') {
      return appData.items;
    }
    return appData.items.where((item) => item.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 178, 203, 207),
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'lib/imagens/Logo_resumida.png',
              height: 50,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ValueListenableBuilder<int>(
              valueListenable: _cartItemCount,
              builder: (context, count, child) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to CartTab
                        Navigator.of(context).pushNamed('/cart');
                      },
                      child: Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                    if (count > 0) ...[
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Color(0xFFF67F7D),
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Center(
                            child: Text(
                              '$count',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Search Field and Categories
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFABC5C5),
                isDense: true,
                hintText: 'Pesquise Aqui...',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(221, 75, 75, 75),
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
          ),
          // Categories
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = appData.categories[index];
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  category: category,
                  isSelected: category == selectedCategory,
                );
              },
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: appData.categories.length,
            ),
          ),
          // Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: getFilteredItems().length,
              itemBuilder: (_, index) {
                final item = getFilteredItems()[index];
                return ItemTile(
                  item: item,
                  onAddToCart: () => _addToCart(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
