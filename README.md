# NextBook - Aplicativo de Loja de Livros 📚

Bem-vindo ao repositório do NextBook, um aplicativo de e-commerce desenvolvido para o TCC e focado na venda de livros. A aplicação oferece uma experiência completa de compra online, com um carrinho de compras funcional, integração com o banco de dados, navegação prática e uma interface amigável para o usuário.

## Funcionalidades 🚀
- **Catálogo de Livros**: Navegue e descubra uma grande variedade de títulos.
- **Carrinho de Compras**: Adicione e remova itens do carrinho.
- **Confirmação de Pedido**: Confirme suas informações de entrega e escolha o método de pagamento.
- **Tela de Pedidos**: Acompanhe seus pedidos e o status da entrega.
- **Integração com SQLite**: Salvamento de dados localmente para consulta rápida.

## Estrutura do Projeto 📂
- **Páginas**: `HomeTab`, `CartTab`, `OrdersTab`.
- **Componentes**: `CartTile` para exibição dos itens no carrinho.
- **Serviços**: `UtilsServices` para formatação de dados.
- **Banco de Dados**: Utiliza o `sqflite` para armazenamento e recuperação de pedidos.

## Pré-requisitos
- [Flutter](https://flutter.dev/) 3.0+
- Dispositivo ou emulador configurado.

## Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/seuusuario/NextBook.git
   
2. Instale as dependências:
   ```bash
   flutter pub get

3. Execute o aplicativo:
 ```bash
flutter run

