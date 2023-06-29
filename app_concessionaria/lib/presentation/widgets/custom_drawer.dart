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
          DrawerHeader(
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
            leading: Icon(Icons.person),
            title: Text('Usuários'),
            onTap: onUsuariosPressed,
          ),
          ListTile(
            leading: Icon(Icons.car_rental),
            title: Text('Carros'),
            onTap: onCarrosPressed,
          ),
        ],
      ),
    );
  }
}
