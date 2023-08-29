import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatefulWidget {
  final Color? color;

  const MenuWidget({super.key, this.color});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(
          FluentIcons.list_20_regular,
          color: widget.color ?? Colors.black,
        ),
        onPressed: () => {
          ZoomDrawer.of(context)!.toggle(),
          FocusManager.instance.primaryFocus?.unfocus(),
        },
      );
}
