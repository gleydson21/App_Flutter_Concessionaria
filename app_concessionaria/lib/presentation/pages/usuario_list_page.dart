import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:app_concessionaria/presentation/pages/usuario_detail_page.dart'
    show UsuarioDetailPage;
import 'package:flutter/material.dart';

import '../../application/usuarios/usuario_repository.dart';

class UsuarioListPage extends StatefulWidget {
  final UsuarioRepository usuarioRepository;

  const UsuarioListPage({
    Key? key,
    required this.usuarioRepository,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsuarioListPageState createState() => _UsuarioListPageState();
}

class _UsuarioListPageState extends State<UsuarioListPage> {
  late Future<List<Usuario>> _usuariosFuture;

  @override
  void initState() {
    _usuariosFuture = _getUsuarios();
    super.initState();
  }

  Future<List<Usuario>> _getUsuarios() async {
    return await widget.usuarioRepository.getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Usuario>>(
        future: _usuariosFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final usuarios = snapshot.data!;

            if (usuarios.isEmpty) {
              return const Center(
                child: Text('Nenhum usuário encontrado'),
              );
            }

            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                final usuario = usuarios[index];

                return ListTile(
                  title: Text(usuario.nome),
                  subtitle: Text(usuario.email),
                  trailing: IconButton(
                    onPressed: () => _editarUsuario(context, usuario),
                    icon: const Icon(Icons.edit),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar usuários'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarUsuario(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _adicionarUsuario(BuildContext context) async {
    final novoUsuario = Usuario(email: '', id: '', nome: '', senha: '');

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsuarioDetailPage(
          usuario: novoUsuario,
          usuarioRepository: widget.usuarioRepository,
        ),
      ),
    );

    setState(() {
      _usuariosFuture = _getUsuarios();
    });
  }

  Future<void> _editarUsuario(BuildContext context, Usuario usuario) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsuarioDetailPage(
          usuario: usuario,
          usuarioRepository: widget.usuarioRepository,
        ),
      ),
    );

    setState(() {
      _usuariosFuture = _getUsuarios();
    });
  }
}
