import 'package:flutter/material.dart';
import 'package:nextbook/src/config/custom_colors.dart';
import 'package:nextbook/src/pages/common_widgets/custom_text_field.dart';
import 'package:nextbook/src/database/db.dart'; // Importa a classe DB

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  // Variáveis para armazenar os dados do usuário
  String? _email;
  String? _name;
  String? _phone;
  String? _cpf;

  // Controladores para o diálogo de atualização de senha
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Carregar os dados do usuário do banco de dados
  Future<void> _loadUserData() async {
    final user = await DB.instance.getUser();

    if (user != null) {
      setState(() {
        _email = user['email'];
        _name = user['nome'];
        _phone = user['celular'];
        _cpf = user['cpf'];
      });
    }
  }

  // Atualizar a senha
  Future<void> _updatePassword() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Atualização de senha",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.vermelhoNext,
                    ),
                  ),
                ),
                // Senha Atual
                CustomTextField(
                  isSecret: true,
                  icon: Icons.lock,
                  label: 'Senha Atual',
                  controller: _currentPasswordController,
                ),
                // Nova Senha
                CustomTextField(
                  isSecret: true,
                  icon: Icons.lock_outline_rounded,
                  label: 'Nova Senha',
                  controller: _newPasswordController,
                ),
                // Confirmar Nova Senha
                CustomTextField(
                  isSecret: true,
                  icon: Icons.lock_outline_rounded,
                  label: 'Confirmar Nova Senha',
                  controller: _confirmPasswordController,
                ),
                // Botão de Confirmação
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.vermelhoNext,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text(
                      'Atualizar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );

    if (result == true) {
      final currentPassword = _currentPasswordController.text;
      final newPassword = _newPasswordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (newPassword == confirmPassword) {
        final success = await DB.instance.updatePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Senha atualizada com sucesso')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Falha ao atualizar a senha')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('As senhas não coincidem')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 203, 207),
        elevation: 0,
        title: const Text(
          'Perfil do usuário',
          style: TextStyle(color: Colors.white),
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
            // Email
            CustomTextField(
              readOnly: true,
              initialValue: _email,
              icon: Icons.email,
              label: 'Email',
            ),
            // Nome
            CustomTextField(
              readOnly: true,
              initialValue: _name,
              icon: Icons.person,
              label: 'Nome',
            ),
            // Celular
            CustomTextField(
              readOnly: true,
              initialValue: _phone,
              icon: Icons.phone,
              label: 'Celular',
            ),
            // CPF
            CustomTextField(
              readOnly: true,
              initialValue: _cpf,
              icon: Icons.file_copy,
              label: 'CPF',
              isSecret: true,
            ),
            // Botão de atualização de senha
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
                onPressed: _updatePassword,
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
}
