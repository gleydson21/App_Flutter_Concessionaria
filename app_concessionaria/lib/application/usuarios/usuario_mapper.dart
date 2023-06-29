import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:app_concessionaria/application/usuarios/usuario_dto.dart';

class UsuarioMapper {
  static Usuario fromDto(UsuarioDTO dto, String id) {
    return Usuario(
      id: id,
      nome: dto.nome,
      email: dto.email,
      senha: dto.senha,
    );
  }

  static UsuarioDTO toDto(Usuario usuario) {
    return UsuarioDTO(
      nome: usuario.nome,
      email: usuario.email,
      senha: usuario.senha,
    );
  }
}
