import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:todoapp/pages/menu.dart';
import 'package:todoapp/pages/settings/settings.dart';

class SettingsPageMain extends StatefulWidget {
  const SettingsPageMain({super.key, required this.title});

  final String title;

  @override
  State<SettingsPageMain> createState() => _SettingsPageMainState();
}

class _SettingsPageMainState extends State<SettingsPageMain> {
  MenuItem currentItem = MenuItems.config;

  @override
  void initState() {
    super.initState();
    currentItem = MenuItems.config;
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
        mainScreen: SettingsPage(
          title: widget.title,
        ),
      );
}
