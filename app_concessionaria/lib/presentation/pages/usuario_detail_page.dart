import 'package:app_concessionaria/domain/usuarios/usuario.dart';
import 'package:app_concessionaria/domain/usuarios/usuario_repository.dart';
import 'package:flutter/material.dart';

class UsuarioDetailPage extends StatefulWidget {
  final Usuario usuario;
  final UsuarioRepository usuarioRepository;

  const UsuarioDetailPage({
    Key? key,
    required this.usuario,
    required this.usuarioRepository,
  }) : super(key: key);

  @override
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
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              controller: _senhaController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _salvar,
                child: Text('Salvar'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _excluir,
                child: Text('Excluir'),
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

    Navigator.of(context).pop();
  }

  Future<void> _excluir() async {
    await widget.usuarioRepository.deleteUsuario(widget.usuario.id!);

    Navigator.of(context).pop();
  }
}
