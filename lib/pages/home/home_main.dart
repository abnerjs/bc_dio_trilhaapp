import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:todoapp/pages/home/home.dart';
import 'package:todoapp/pages/menu.dart';

class HomePageMain extends StatefulWidget {
  const HomePageMain({super.key, required this.title});

  final String title;

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  MenuItem currentItem = MenuItems.home;

  @override
  void initState() {
    super.initState();
    currentItem = MenuItems.home;
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        menuBackgroundColor: Colors.deepPurple,
        menuScreenWidth: double.infinity,
        mainScreenTapClose: true,
        angle: 0,
        style: DrawerStyle.defaultStyle,
        boxShadow: const [
          BoxShadow(color: Colors.white38, blurRadius: 1),
        ],
        menuScreen: MenuPage(
            context: context,
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
            }),
        mainScreen: HomePage(
          title: widget.title,
        ),
      );
}
