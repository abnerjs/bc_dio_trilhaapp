import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20, left: 40, bottom: 40),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/eu.jpg'),
                  ),
                  SizedBox(height: 20),
                  Text('Abner J. Silva',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  Text('Presidente Epitácio, SP',
                      style: TextStyle(
                          color: Color.fromARGB(255, 180, 180, 180),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                minLeadingWidth: 20,
                leading: const Icon(
                  FluentIcons.arrow_exit_20_filled,
                  color: Colors.white,
                  size: 24,
                ),
                title: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
          ],
        ),
      ));
}

Widget buildMenuItem(MenuItem item) => ListTile(
      minLeadingWidth: 20,
      contentPadding: const EdgeInsets.symmetric(horizontal: 40),
      leading: Icon(
        item.icon,
        color: Colors.white,
        size: 24,
      ),
      title: Text(
        item.title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onTap: () {},
    );

class MenuItems {
  static const home =
      MenuItem(title: 'Início', icon: FluentIcons.home_16_regular);
  static const perfil =
      MenuItem(title: 'Perfil', icon: FluentIcons.person_16_regular);
  static const config =
      MenuItem(title: 'Configurações', icon: FluentIcons.settings_16_regular);

  static const all = <MenuItem>[
    home,
    perfil,
    config,
  ];
}

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem({required this.title, required this.icon});
}
