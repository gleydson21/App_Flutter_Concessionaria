import 'package:app_concessionaria/domain/carros/carro.dart';
import '../../infrastructure/repositories/carros/carro_repository.dart';
import 'package:flutter/material.dart';

class CarroDetailPage extends StatefulWidget {
  final Carro carro;
  final CarroRepository carroRepository;

  const CarroDetailPage({
    Key? key,
    required this.carro,
    required this.carroRepository,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CarroDetailPageState createState() => _CarroDetailPageState();
}

class _CarroDetailPageState extends State<CarroDetailPage> {
  late TextEditingController _marcaController;
  late TextEditingController _modeloController;
  late TextEditingController _anoController;
  late TextEditingController _corController;
  late TextEditingController _imagemUrlController;

  @override
  void initState() {
    _marcaController = TextEditingController(text: widget.carro.marca);
    _modeloController = TextEditingController(text: widget.carro.modelo);
    _anoController = TextEditingController(text: widget.carro.ano.toString());
    _corController = TextEditingController(text: widget.carro.cor);
    _imagemUrlController = TextEditingController(text: widget.carro.imagemUrl);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.modelo),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _marcaController,
              decoration: const InputDecoration(labelText: 'Marca'),
            ),
            TextFormField(
              controller: _modeloController,
              decoration: const InputDecoration(labelText: 'Modelo'),
            ),
            TextFormField(
              controller: _anoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Ano'),
            ),
            TextFormField(
              controller: _corController,
              decoration: const InputDecoration(labelText: 'Cor'),
            ),
            TextFormField(
              controller: _imagemUrlController,
              decoration: const InputDecoration(labelText: 'Imagem URL'),
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
    final carro = widget.carro.copyWith(
      marca: _marcaController.text,
      modelo: _modeloController.text,
      ano: int.tryParse(_anoController.text) ?? widget.carro.ano,
      cor: _corController.text,
      imagemUrl: _imagemUrlController.text,
    );

    await widget.carroRepository.saveCarro(carro);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> _excluir() async {
    await widget.carroRepository.deleteCarro(widget.carro.id);

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}
