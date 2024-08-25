import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();
  static final DB instance = DB._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuario(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT NOT NULL,
            senha TEXT NOT NULL,
            nome TEXT NOT NULL,
            cpf TEXT NOT NULL,
            celular TEXT NOT NULL
          )
        ''');
      },
      version: 1,
    );
  }

  Future<Map<String, dynamic>?> signIn(String email, String senha) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db!.query(
      'usuario',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getUser() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db!.query('usuario', limit: 1);

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<bool> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final db = await instance.database;

    // Verificar se a senha atual está correta
    final List<Map<String, dynamic>> result = await db!.query(
      'usuario',
      where: 'senha = ?',
      whereArgs: [currentPassword],
    );

    if (result.isNotEmpty) {
      // Atualizar a senha
      final updateCount = await db.update(
        'usuario',
        {'senha': newPassword},
        where: 'senha = ?',
        whereArgs: [currentPassword],
      );

      return updateCount > 0;
    }
    return false;
  }

  // Novo método para verificar se o email está registrado
  Future<bool> emailExists(String email) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db!.query(
      'usuario',
      where: 'email = ?',
      whereArgs: [email],
    );

    return result.isNotEmpty;
  }

  // Novo método para enviar o email de recuperação (exemplo fictício)
  Future<bool> sendPasswordResetEmail(String email) async {
    // Aqui você deve integrar com um serviço de email real.
    // Exemplo fictício:
    if (await emailExists(email)) {
      // Suponha que você tenha uma função que envia o email.
      // `sendEmail` é um placeholder para o método real que você usaria.
      bool emailSent = await sendEmail(email);
      return emailSent;
    }
    return false;
  }

  // Função fictícia para enviar um email
  Future<bool> sendEmail(String email) async {
    // Implementar a lógica para enviar email.
    // Pode envolver uma API de serviço de email.
    print('Enviando email para $email');
    return true; // Retorne true se o email foi enviado com sucesso
  }
}
