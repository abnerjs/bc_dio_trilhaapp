import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xFF4b134f),
            Color(0xFFc94b4b),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.title,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: const MenuWidget(
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 40,
                left: 40,
                top: 40,
              ),
              child: const Text(
                "Parece tudo tranquilo por aqui...",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 40,
                left: 40,
                top: 5,
              ),
              child: const Text(
                "3 atividades para hoje.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(
                right: 48,
                left: 48,
                bottom: 10,
              ),
              child: const Text(
                "Categorias",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
              child: Card(
                elevation: 20,
                color: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: (MediaQuery.of(context).size.width - 80) / 3 * 4,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) =>
                                const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF4b134f),
                                Color(0xFFc94b4b),
                              ],
                            ).createShader(bounds),
                            child: const Icon(
                              FluentIcons.person_32_filled,
                              size: 32,
                            ),
                          ),
                          const Spacer(),
                          const IconButton(
                            onPressed: null,
                            icon: Icon(FluentIcons.more_vertical_20_regular),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        'Pessoal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
