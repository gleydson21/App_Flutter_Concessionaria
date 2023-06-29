import 'package:app_concessionaria/application/usuarios/usuario_repository.dart';
import 'package:app_concessionaria/domain/usuarios/usuario.dart';

class UsuarioService {
  final UsuarioRepository _usuarioRepository;

  UsuarioService(this._usuarioRepository);

  Future<List<Usuario>> getUsuarios() async {
    return await _usuarioRepository.getUsuarios();
  }

  Future<Usuario> getUsuarioById(String id) async {
    return await _usuarioRepository.getUsuarioById(id);
  }

  Future<void> saveUsuario(Usuario usuario) async {
    await _usuarioRepository.saveUsuario(usuario);
  }

  Future<void> deleteUsuario(String id) async {
    await _usuarioRepository.deleteUsuario(id);
  }
}
