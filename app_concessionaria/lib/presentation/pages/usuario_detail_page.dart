import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:flutter/material.dart';

import '../../application/usuarios/usuario_repository.dart';

class UsuarioDetailPage extends StatefulWidget {
  final Usuario usuario;
  final UsuarioRepository usuarioRepository;

  const UsuarioDetailPage({
    Key? key,
    required this.usuario,
    required this.usuarioRepository,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UsuarioDetailPageState createState() => _UsuarioDetailPageState();
}

class _UsuarioDetailPageState extends State<UsuarioDetailPage> {
  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  @override
  void initState() {
    _nomeController = TextEditingController(text: widget.usuario.nome);
    _emailController = TextEditingController(text: widget.usuario.email);
    _senhaController = TextEditingController(text: widget.usuario.senha);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usuario.nome),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvar,
                child: const Text('Salvar'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _excluir,
                child: const Text('Excluir'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _salvar() async {
    final usuario = widget.usuario.copyWith(
      nome: _nomeController.text,
      email: _emailController.text,
      senha: _senhaController.text,
    );

    await widget.usuarioRepository.saveUsuario(usuario);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> _excluir() async {
    await widget.usuarioRepository.deleteUsuario(widget.usuario.id);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}
