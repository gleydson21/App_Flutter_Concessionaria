import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onUsuariosPressed;
  final VoidCallback onCarrosPressed;

  const CustomDrawer({
    Key? key,
    required this.onUsuariosPressed,
    required this.onCarrosPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
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
            leading: const Icon(Icons.person),
            title: const Text('Usuários'),
            onTap: onUsuariosPressed,
          ),
          ListTile(
            leading: const Icon(Icons.car_rental),
            title: const Text('Carros'),
            onTap: onCarrosPressed,
          ),
        ],
      ),
    );
  }
}
