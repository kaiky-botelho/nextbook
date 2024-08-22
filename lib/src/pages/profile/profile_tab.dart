import 'package:flutter/material.dart';
import 'package:nextbook/src/config/custom_colors.dart';
import 'package:nextbook/src/pages/common_widgets/custom_text_field.dart';
import 'package:nextbook/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 203, 207),
        elevation: 0,
        title: const Text(
          'Perfil do usuário',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          children: [
            //email
            CustomTextField(
              readOnly: true,
              initialValue: appData.user.email,
              icon: Icons.email,
              label: 'Email',
            ),
            //nome
            CustomTextField(
              readOnly: true,
              initialValue: appData.user.name,
              icon: Icons.person,
              label: 'Nome',
            ),
            //celular
            CustomTextField(
              readOnly: true,
              initialValue: appData.user.phone,
              icon: Icons.phone,
              label: 'Celular',
            ),
            //cpf
            CustomTextField(
              readOnly: true,
              initialValue: appData.user.cpf,
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
            ),
            //Botão de atualização de senha
            SizedBox(
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: CustomColors.vermelhoNext,
                  ),
                ),
                onPressed: () {
                  updatePassword();
                },
                child: Text(
                  "Atualizar Senha",
                  style: TextStyle(
                    color: CustomColors.vermelhoNext,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Titulo
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Atualização de senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.vermelhoNext),
                      ),
                    ),
                    //Senha Atual
                    const CustomTextField(
                        isSecret: true, icon: Icons.lock, label: 'Senha Atual'),
                    //Nova senha
                    const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline_rounded,
                        label: 'Nova Senha'),

                    //Confirmacao senha

                    const CustomTextField(
                        isSecret: true,
                        icon: Icons.lock_outline_rounded,
                        label: 'Confirmar Nova Senha'),

                    //Botão de confirmação
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors
                              .vermelhoNext, // Definindo o vermelhoNext como fundo
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Atualizar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  }, 
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
