import 'package:app_concessionaria/data/usuarios/usuarios_database.dart';
import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:app_concessionaria/domain/usuarios/usuario_repository.dart';

import '../../../application/usuarios/usuario_repository.dart';
import '../../database/usuarios/usuarios_database.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final usuariosDatabase = UsuariosDatabase.instance;

  @override
  Future<List<Usuario>> getUsuarios() async {
    return await usuariosDatabase.getUsuarios();
  }

  @override
  Future<Usuario?> getUsuarioById(String id) async {
    return await usuariosDatabase.getUsuarioById(id);
  }

  @override
  Future<void> saveUsuario(Usuario usuario) async {
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

  @override
  Future<Usuario?> login(String email, String senha) async {
    final usuarios = await usuariosDatabase.getUsuarios();

    final usuario = usuarios.firstWhere(
      (usuario) => usuario.email == email && usuario.senha == senha,
      orElse: () => null,
    );

    return usuario;
  }
}
