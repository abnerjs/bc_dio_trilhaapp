import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) => IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => ZoomDrawer.of(context)!.toggle(),
        color: Colors.white,
      );
}
