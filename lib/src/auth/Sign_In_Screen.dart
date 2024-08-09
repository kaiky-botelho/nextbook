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
                    //Email
                    const CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                    ),
                    //Senha
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "senha",
                      isSecret: true,
                    ),

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Entrar', style: TextStyle(fontSize: 20),),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
