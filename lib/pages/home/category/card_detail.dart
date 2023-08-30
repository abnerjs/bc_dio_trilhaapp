import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/model/card_data.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CardData;

    return Hero(
      tag: args.label,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FluentIcons.chevron_left_24_regular),
          ),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(FluentIcons.more_vertical_20_regular),
              color: Color(0xFF333333),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: args.colors,
                    ).createShader(bounds),
                    child: Icon(
                      args.icon,
                      size: 32,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Text(
                      '9 tarefas',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF555555),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      args.label,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF333333),
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 8 / 10,
                          backgroundColor: Colors.grey[400],
                          color: args.colors[0],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          '80%',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
