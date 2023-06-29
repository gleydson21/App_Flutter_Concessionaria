import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioCard extends StatelessWidget {
  final Usuario usuario;

  const UsuarioCard({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(usuario.nome),
        subtitle: Text(usuario.email),
        trailing: Icon(Icons.arrow_forward),
        onTap: () => _editarUsuario(context),
      ),
    );
  }

  Future<void> _editarUsuario(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsuarioDetailPage(
          usuario: usuario,
          usuarioRepository: usuarioRepository,
        ),
      ),
    );
  }
}
