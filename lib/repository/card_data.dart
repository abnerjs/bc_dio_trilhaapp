import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../model/card_data.dart';

class CardDataRepository {
  List<CardData> data = [
    CardData("Pessoal", FluentIcons.person_32_filled, [
      const Color(0xFF4b134f),
      const Color(0xFFc94b4b),
    ]),
    CardData("Trabalho", FluentIcons.briefcase_32_filled, [
      const Color(0xFF134E5E),
      const Color(0xFF71B280),
    ]),
    CardData("Estudos", FluentIcons.book_default_28_filled, [
      const Color(0xFF16222A),
      const Color(0xFF3A6073),
    ]),
  ];
}
