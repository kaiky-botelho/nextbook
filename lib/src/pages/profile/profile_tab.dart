import 'package:flutter/material.dart';
import 'package:nextbook/src/pages/common_widgets/custom_text_field.dart';
import 'package:nextbook/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

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

      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          CustomTextField(
            readOnly: true,
          initialValue: appData.user.email,
          icon: Icons.email, 
          label: 'Email'
          ),
          //nome
          CustomTextField(
          readOnly: true,
          initialValue: appData.user.name,
          icon: Icons.person, 
          label: 'Nome'
          ),
          //celular
          CustomTextField(
          readOnly: true,
          initialValue: appData.user.phone,
          icon: Icons.phone, 
          label: 'Celular'
          ),
          //cpf
          CustomTextField( 
          readOnly: true,
          initialValue: appData.user.cpf,
          icon: Icons.file_copy, 
          label: 'CPF',
          isSecret: true,
          ),
        ],
      ) ,
    );
  }
}
