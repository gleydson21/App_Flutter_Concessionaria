import '../../database/usuarios/usuarios_database.dart' show UsuariosDatabase;
import 'package:app_concessionaria/domain/usuarios/usuario.dart';

import '../../../application/usuarios/usuario_repository.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final usuariosDatabase = UsuariosDatabase.instance;

  @override
  Future<List<Usuario>> getUsuarios() async {
    final usuariosJson = await usuariosDatabase.getUsuarios();
    final usuarios =
        usuariosJson.map((json) => Usuario.fromJson(json)).toList();
    return usuarios;
  }

  @override
  Future<Usuario> getUsuarioById(String id) async {
    final usuarioJson = await usuariosDatabase.getUsuarioById(id);
    if (usuarioJson != null) {
      return Usuario.fromJson(usuarioJson as Map<String, Object?>);
    } else {
      throw Exception('Usuário não encontrado');
    }
  }

  @override
  Future<void> saveUsuario(Usuario usuario) async {
    // ignore: unnecessary_null_comparison
    if (usuario.id != null) {
      return await usuariosDatabase.updateUsuario(usuario);
    } else {
      return await usuariosDatabase.addUsuario(usuario);
    }
  }

  @override
  Future<void> deleteUsuario(String id) async {
    return await usuariosDatabase.deleteUsuario(id);
  }

  Future<Usuario?> login(String email, String senha) async {
    final usuarios = await usuariosDatabase.getUsuarios();

    final usuario = usuarios.firstWhere(
      (usuario) => usuario.email == email && usuario.senha == senha,
      orElse: () => null,
    );

    return usuario;
  }
}
