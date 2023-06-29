import 'package:app_concessionaria/domain/carros/carro.dart';
import 'package:app_concessionaria/domain/carros/carro_repository.dart';
import 'package:app_concessionaria/presentation/carro_detail_page.dart';
import 'package:flutter/material.dart';

class CarroListPage extends StatefulWidget {
  final CarroRepository carroRepository;

  const CarroListPage({
    Key? key,
    required this.carroRepository,
  }) : super(key: key);

  @override
  _CarroListPageState createState() => _CarroListPageState();
}

class _CarroListPageState extends State<CarroListPage> {
  late Future<List<Carro>> _carrosFuture;

  @override
  void initState() {
    _carrosFuture = _getCarros();
    super.initState();
  }

  Future<List<Carro>> _getCarros() async {
    return await widget.carroRepository.getCarros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Carro>>(
        future: _carrosFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final carros = snapshot.data!;

            if (carros.isEmpty) {
              return Center(
                child: Text('Nenhum carro encontrado'),
              );
            }

            return ListView.builder(
              itemCount: carros.length,
              itemBuilder: (context, index) {
                final carro = carros[index];

                return ListTile(
                  leading: Image.network(carro.imagemUrl),
                  title: Text(carro.modelo),
                  subtitle: Text('${carro.marca} - ${carro.ano}'),
                  trailing: IconButton(
                    onPressed: () => _editarCarro(context, carro),
                    icon: Icon(Icons.edit),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar carros'),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _adicionarCarro(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _adicionarCarro(BuildContext context) async {
    final novoCarro = Carro();

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CarroDetailPage(
          carro: novoCarro,
          carroRepository: widget.carroRepository,
        ),
      ),
    );

    setState(() {
      _carrosFuture = _getCarros();
    });
  }

  Future<void> _editarCarro(BuildContext context, Carro carro) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CarroDetailPage(
          carro: carro,
          carroRepository: widget.carroRepository,
        ),
      ),
    );

    setState(() {
      _carrosFuture = _getCarros();
    });
  }
}
