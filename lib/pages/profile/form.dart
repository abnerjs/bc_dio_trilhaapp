import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trilhaapp/repository/technologies.dart';
import 'package:intl/date_symbol_data_file.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({super.key, required this.controller});

  final PageController controller;

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  var nomeController = TextEditingController(text: "");
  var dataNacimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var linguagensRepository = TecnologiaRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 140, left: 20, bottom: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        labelText: 'Nome',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      controller: dataNacimentoController,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            FluentIcons.calendar_20_regular,
                            color: Colors.deepPurple,
                          ),
                          color: const Color.fromARGB(255, 170, 170, 170),
                          onPressed: () async {
                            var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime(
                                int.tryParse(dataNacimentoController.text
                                        .substring(6)) ??
                                    2000,
                                int.tryParse(dataNacimentoController.text
                                        .substring(3, 5)) ??
                                    05,
                                int.tryParse(dataNacimentoController.text
                                        .substring(0, 2)) ??
                                    20,
                              ),
                              firstDate: DateTime(1900, 5, 20),
                              lastDate: DateTime.now(),
                            );
                            if (date != null) {
                              dataNacimentoController.text =
                                  DateFormat('dd/MM/yyyy').format(date);
                              dataNascimento = date;
                            }
                          },
                        ),
                        fillColor: const Color.fromARGB(255, 240, 240, 240),
                        labelText: 'Data de nascimento',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        widget.controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Text(
                        "Cancelar",
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
            ),
          ),
        ],
      );
}
