import 'package:app_concessionaria/domain/usuarios/usuario.dart';

abstract class UsuarioRepository {
  Future<List<Usuario>> getUsuarios();

  Future<Usuario> getUsuarioById(String id);

  Future<void> saveUsuario(Usuario usuario);

  Future<void> deleteUsuario(String id);
}
