import 'package:flutter/material.dart';
import 'package:app_concessionaria/presentation/pages/carro_list_page.dart';
import 'package:app_concessionaria/infrastructure/repositories/carros/carro_repository_impl.dart';

import 'infrastructure/repositories/carros/carro_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CarroRepository carroRepository = CarroRepositoryImpl();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha aplicação',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/carros': (context) => CarroListPage(carroRepository: carroRepository),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha aplicação'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/carros');
          },
          child: const Text('Ver lista de carros'),
        ),
      ),
    );
  }
}