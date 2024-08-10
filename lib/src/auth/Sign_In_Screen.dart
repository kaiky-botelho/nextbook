import 'package:flutter/material.dart';
import 'package:nextbook/src/auth/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(178, 203, 207, 1),
      body: Column(
        children: [
          Expanded(
            child: Container(color: Color.fromRGBO(178, 203, 207, 1)),
          ),
          Expanded(
            child: Container(
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

                  //Botão de entrar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        backgroundColor: Color(0xFFF67F7D),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),

                  //Esqueceu a senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a Senha?',
                        style: TextStyle(color: Color(0xFFF67F7D)),
                      ),
                    ),
                  ),

                  //Divisor
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

                  //Botão de Novo Usuario
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        ),
                        side: BorderSide(
                          width: 2,
                          color: Color(0xFFF67F7D),
                          
                        )
                      ),
                      onPressed: () {},
                      child: const Text("Criar conta", style: TextStyle(color: Colors.black, fontSize: 20), ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
