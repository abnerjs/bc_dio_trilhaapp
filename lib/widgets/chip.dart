import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget(
      {super.key,
      required this.label,
      required this.color,
      this.starred = false});
  final String label;
  final Color color;
  final bool starred;

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) => Chip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        side: BorderSide(
          color: widget.color,
          width: 0,
        ),
        avatar: widget.starred
            ? const Icon(
                FluentIcons.star_16_filled,
                size: 16,
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        label: Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: widget.color,
      );
}
