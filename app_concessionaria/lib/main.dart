import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Exemplo de Scaffold com Navbar fluida',
      home: MyScaffold(),
      debugShowCheckedModeBanner: false, // remover o texto "Debug" da barra superior
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red, // cor de fundo vermelha
        centerTitle: true, // título centralizado
        title: const Text('Gleydson Developer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // navegar para a tela Home
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //  navegar para a tela de Pesquisa
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // navegar para a tela de Favoritos
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Corpo da página'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // aqui os ícones foram removidos
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Pesquisar'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/pesquisar');
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/favoritos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/perfil');
              },
            ),
          ],
        ),
      ),
    );
  }
}