import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/repository/card_data.dart';
import 'package:todoapp/widgets/menu.dart';

import '../../model/card_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataRepository = CardDataRepository();
  List<CardData> data = [];

  @override
  void initState() {
    super.initState();
    data = dataRepository.data;
  }

  var _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: data[_activeIndex].colors,
        ),
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
            Expanded(
              flex: 2,
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification) {
                  setState(() {
                    _activeIndex = notification.metrics.pixels ~/
                        (MediaQuery.of(context).size.width - 80);
                  });
                  return true;
                },
                child: PageView.builder(
                  itemCount: data.length,
                  controller: PageController(viewportFraction: 0.8),
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return _buildCarouselItem(context, 1, itemIndex);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int aux, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () => Navigator.pushNamed(
          context,
          '/card-detail',
          arguments: data[itemIndex],
        ),
        child: Hero(
          tag: data[itemIndex].label,
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
                        shaderCallback: (Rect bounds) => LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: data[itemIndex].colors,
                        ).createShader(bounds),
                        child: Icon(
                          data[itemIndex].icon,
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
                    '9 tarefas',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF555555),
                    ),
                  ),
                  Text(
                    data[itemIndex].label,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 8 / 10,
                            backgroundColor: Colors.grey[400],
                            color: data[itemIndex].colors[0],
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
