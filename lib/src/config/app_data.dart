import 'package:nextbook/src/models/cart_item_model.dart';
import 'package:nextbook/src/models/item_model.dart';
import 'package:nextbook/src/models/order_model.dart';

ItemModel hipotese = ItemModel(
  itemName: 'A hipótese do amor',
  imgUrl: 'assets/livros/A_Hipotese.jpg',
  price: 34.90,
  unit: 'und',
  condition: 'Novo',
  description: 'Quando um namoro de mentira entre cientistas encontra a irresistível força da atração, todas as teorias cuidadosamente calculadas sobre o amor são postas à prova...',
  category: 'Romance',
);

ItemModel melhorFilme = ItemModel(
  itemName: 'Melhor do que nos filmes',
  imgUrl: 'assets/livros/Melhor_filmes.jpg',
  price: 20.00,
  unit: 'und',
  condition: 'Usado',
  description: 'Elizabeth Buxbaum sempre soube que seu vizinho não seria um bom namorado. Apesar de todos acharem Wesley Bennett simpático e muito bonito, Liz tinha certeza de que ele era um chato de galochas...',
    category: 'Romance',
);

ItemModel orgulho = ItemModel(
  itemName: 'Orgulho e preconceito',
  imgUrl: 'assets/livros/Org_prec.jpg',
  price: 40.90,
  unit: 'und',
  condition: 'Novo',
  description: 'Orgulho e preconceito é o livro mais famoso de Jane Austen e possui uma série de personagens inesquecíveis e um enredo memorável...',
    category: 'Romance',

);

ItemModel farsaEspanha = ItemModel(
  itemName: 'Uma Farsa de amor na Espanha',
  imgUrl: 'assets/livros/farsa_Espanha.jpg',
  price: 15.90,
  unit: 'und',
  condition: 'Usado',
  description: 'Uma viagem à Espanha, o homem mais irritante do mundo e três dias para convencer todo mundo de que vocês estão realmente apaixonados...',
    category: 'Romance',

);

ItemModel mecanicaAmor = ItemModel(
  itemName: 'A mecânica do amor',
  imgUrl: 'assets/livros/Mecanica_Love.jpg',
  price: 40.90,
  unit: 'und',
  condition: 'Novo',
  description: 'Bel não sabe o que fazer quando se formar no colégio e nem quer pensar no assunto. Mas quando revela um talento especial para engenharia, é incentivada por uma professora a entrar para o clube de robótica da escola...',
    category: 'Romance',

);

ItemModel leituraVerao = ItemModel(
  itemName: 'Leitura de verão',
  imgUrl: 'assets/livros/leituraVerao.jpg',
  price: 20.90,
  unit: 'und',
  condition: 'Usado',
  description: 'Augustus Everett é um aclamado autor de ficção literária. January Andrews escreve romances best-seller. Enquanto ela cria seus “felizes para sempre”, ele mata todos os seus personagens...',
    category: 'Romance',

);

ItemModel turneHeart = ItemModel(
  itemName: 'A turnê do coração partido',
  imgUrl: 'assets/livros/tureneHeart.jpg',
  price: 38.90,
  unit: 'und',
  condition: 'Novo',
  description: 'Riley Wynn virou uma superestrela da noite para o dia graças ao seu álbum com músicas de término e um single inesquecível...',
    category: 'Romance',

);

ItemModel amorGelo = ItemModel(
  itemName: 'Amor & Gelato: 1',
  imgUrl: 'assets/livros/loveGelato.jpg',
  price: 10.90,
  unit: 'und',
  condition: 'Usado',
  description: 'Depois da morte da mãe, Lina fica com a missão de realizar um último pedido: ir até a Itália para conhecer o pai...',
    category: 'Romance',

);

List<ItemModel> items = [
  hipotese,
  melhorFilme,
  orgulho,
  farsaEspanha,
  mecanicaAmor,
  leituraVerao,
  turneHeart,
  amorGelo,
];

List<String> categories = [
  "Romance",
  'Ficção Científica',
  'Terror',
  'Suspense',
  'Fantasia',
];

List<CartItemModel> cartItems = [
  CartItemModel(item: hipotese, quantity: 1),
  CartItemModel(item: melhorFilme, quantity: 1),
  CartItemModel(item: amorGelo, quantity: 1),
];

List<OrderModel> orders = [
  OrderModel(
    id: 'aabb564djjks',
    createdDateTime: DateTime.parse('2024-11-20 10:00:10.458'),
    overdueDateTime: DateTime.parse('2024-11-15 11:00:10.4580'),
    items: [
      CartItemModel(item: hipotese, quantity: 1),
      CartItemModel(item: melhorFilme, quantity: 1),
      CartItemModel(item: amorGelo, quantity: 1),
    ],
    status: 'pending_payment',
    copyAndPaste: 'jdksjhfskjfh87384edsda',
    total: 0, // Esse total deve ser calculado corretamente com base nos itens do pedido
  )
];
