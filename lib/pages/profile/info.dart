import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/chip.dart';

class Info extends StatefulWidget {
  const Info({super.key, required this.controller});

  final PageController controller;

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(top: 140, left: 20, bottom: 20, right: 20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/eu.jpg'),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: const Center(
                child: Text(
                  'Abner J. Silva',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  'Presidente Epitácio, SP',
                  style: TextStyle(
                    color: Color.fromARGB(255, 180, 180, 180),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    'Nascimento: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    '08/05/2000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Nivel de experiência: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Júnior',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Tecnologias: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: [
                ChipWidget(
                    label: 'React', color: Color(0xFFDDDDDD), starred: true),
                ChipWidget(
                    label: 'TypeScript',
                    color: Color(0xFFDDDDDD),
                    starred: true),
                ChipWidget(
                    label: 'Flutter', color: Color(0xFFDDDDDD), starred: true),
                ChipWidget(label: 'JavaScript', color: Color(0xFFDDDDDD)),
                ChipWidget(label: 'Java', color: Color(0xFFDDDDDD)),
                ChipWidget(label: 'MySQL', color: Color(0xFFDDDDDD)),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            SizedBox(
              child: TextButton.icon(
                onPressed: () {
                  widget.controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.deepPurple,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                label: Text(
                  "Editar",
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
