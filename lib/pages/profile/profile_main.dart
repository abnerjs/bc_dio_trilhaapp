import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:todoapp/pages/menu.dart';
import 'package:todoapp/pages/profile/profile.dart';

class ProfilePageMain extends StatefulWidget {
  const ProfilePageMain({super.key, required this.title});

  final String title;

  @override
  State<ProfilePageMain> createState() => _ProfilePageMainState();
}

class _ProfilePageMainState extends State<ProfilePageMain> {
  MenuItem currentItem = MenuItems.perfil;

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
        mainScreen: ProfilePage(
          title: widget.title,
        ),
      );
}
