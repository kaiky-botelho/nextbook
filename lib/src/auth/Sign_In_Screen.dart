import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nextbook/src/auth/components/custom_text_field.dart';
import 'package:nextbook/src/auth/sign_up_screen.dart';
import 'package:nextbook/src/base/base_screen.dart';
import 'package:nextbook/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.FundoNext,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Imagem do App
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.asset(
                        'lib/imagens/logo.png', 
                        height: 100, 
                      ),
                    ),
                    // Categoria
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Venda de livros'),
                            FadeAnimatedText('Livros Usados'),
                            FadeAnimatedText('Livros Novos'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
          
              // Formulário
          
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Email
                    const CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                    ),
              
                    // Senha
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "senha",
                      isSecret: true,
                    ),
              
                    // Botão de entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: (
                        ) {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){
                            return const BaseScreen();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          backgroundColor: CustomColors.VermelhoNext,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
              
                    // Esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueceu a Senha?',
                          style: TextStyle(color: CustomColors.VermelhoNext),
                        ),
                      ),
                    ),
              
                    // Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('Ou'),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
              
                    // Botão de Novo Usuario
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side:  BorderSide(
                            width: 2,
                            color: CustomColors.VermelhoNext,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c){
                              return SignUpScreen();
                            }),
                          );
                        },
                        child:  Text(
                          "Criar conta",
                          style: TextStyle(color: CustomColors.VermelhoNext, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
