import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: GoogleFonts.montserrat(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        leading: const MenuWidget(),
      ),
    );
  }
}
