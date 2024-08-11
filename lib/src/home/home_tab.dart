import 'package:flutter/material.dart';
import 'package:nextbook/src/home/category_tile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [
    "Romance",
    'Ficção Científca',
    'Terror',
    'Suspense',
    'Fantasia',
  ];

  String selectedCategory = 'Romance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Definindo a cor de fundo
      backgroundColor: Colors.blueGrey[50],

      // App bar
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
            child: GestureDetector(
              onTap: () {},
              child: const Badge(
                  backgroundColor: Color(0xFFF67F7D),
                  label: Text(
                    '2',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  child: Icon(Icons.shopping_cart, color: Colors.white)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Campo Pesquisa
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
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),
          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                    category: categories[index],
                    isSelected: categories[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(width: 10),
                itemCount: categories.length),
          )
          // Grid
        ],
      ),
    );
  }
}
