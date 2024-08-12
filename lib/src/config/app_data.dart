import 'package:nextbook/src/models/item_model.dart';

ItemModel hipotese = ItemModel(
  itemName: 'A hipótese do amor',
  imgUrl: 'assets/livros/A_Hipotese.jpg',
  price: 34.90,
  condition: 'Novo',
);

ItemModel melhorFilme = ItemModel(
  itemName: 'Melhor do que nos filmes',
  imgUrl: 'assets/livros/Melhor_filmes.jpg',
  price: 20.00,
  condition: 'Usado',
);

ItemModel orgulho = ItemModel(
  itemName: 'Orgulho e preconceito',
  imgUrl: 'assets/livros/Org_prec.jpg',
  price: 40.90,
  condition: '  Novo',
);

ItemModel farsaEspanha = ItemModel(
  itemName: 'Uma Farsa de amor na Espanha',
  imgUrl: 'assets/livros/farsa_Espanha.jpg',
  price: 15.90,
  condition: 'Usado',
);

ItemModel mecanicaAmor = ItemModel(
  itemName: 'A mecânica do amor ',
  imgUrl: 'assets/livros/Mecanica_Love.jpg',
  price: 40.90,
  condition: 'Novo',
);

ItemModel leituraVerao = ItemModel(
  itemName: 'A hipótese do amor',
  imgUrl: 'assets/livros/leituraVerao.jpg',
  price: 20.90,
  condition: 'Usado',
);

ItemModel turneHeart = ItemModel(
  itemName: 'A turnê do coração partido',
  imgUrl: 'assets/livros/tureneHeart.jpg',
  price: 38.90,
  condition: 'Novo',
);

ItemModel amorGelo = ItemModel(
  itemName: 'Amor & Gelato: 1',
  imgUrl: 'assets/livros/loveGelato.jpg',
  price: 10.90,
  condition: 'Usado',
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
    'Ficção Científca',
    'Terror',
    'Suspense',
    'Fantasia',
  ];
