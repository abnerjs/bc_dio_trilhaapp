import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
        icon: const Icon(FluentIcons.list_20_regular),
        onPressed: () => {
          ZoomDrawer.of(context)!.toggle(),
          FocusManager.instance.primaryFocus?.unfocus(),
        },
      );
}
