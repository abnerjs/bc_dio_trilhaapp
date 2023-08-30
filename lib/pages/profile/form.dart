import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:todoapp/repository/technologies.dart';
import 'package:todoapp/utils/input_mask.dart';

import '../../widgets/chip.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({super.key, required this.controller});

  final PageController controller;

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  var nomeController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var dateController = dateMask;
  var tecnologiasRepository = TecnologiaRepository();
  var niveis = [];
  var selectedOption = "";
  var tecnologias = [];
  var tecnologiasSelecionadas = [];

  @override
  void initState() {
    super.initState();
    niveis = ["Júnior", "Pleno", "Sênior"];
    tecnologias = tecnologiasRepository.tecnologias();
  }

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
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 240, 240, 240),
                        labelText: 'Nome',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        dateController.formatter,
                      ],
                      controller: dateController.textController,
                      validator: dateController.validator,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                              locale: const Locale("pt", "BR"),
                              initialDate: DateTime(
                                dateController.textController.text.length ==
                                            10 &&
                                        int.tryParse(dateController
                                                .textController.text
                                                .substring(6))! <=
                                            DateTime.now().year
                                    ? int.tryParse(dateController
                                            .textController.text
                                            .substring(6)) ??
                                        DateTime.now().year
                                    : DateTime.now().year,
                                dateController.textController.text.length == 10
                                    ? int.tryParse(dateController
                                            .textController.text
                                            .substring(3, 5)) ??
                                        DateTime.now().month
                                    : DateTime.now().month,
                                dateController.textController.text.length == 10
                                    ? int.tryParse(dateController
                                            .textController.text
                                            .substring(0, 2)) ??
                                        DateTime.now().day
                                    : DateTime.now().day,
                              ),
                              firstDate: DateTime(1900, 5, 20),
                              lastDate: DateTime.now(),
                            );
                            if (date != null) {
                              dateController.textController.text =
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "Nivel de experiência",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: niveis
                            .map(
                              (e) => Expanded(
                                child: RadioListTile(
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                  title: Text(
                                    e.toString(),
                                    style: TextStyle(
                                      fontWeight: selectedOption == e.toString()
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(0),
                                  value: e.toString(),
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value.toString();
                                    });
                                  },
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MultiSelectBottomSheetField(
                        cancelText: const Text("CANCELAR"),
                        searchHint: "Pesquisar",
                        title: const Text(
                          "   Tecnologias",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                        buttonIcon: const Icon(
                          FluentIcons.chevron_down_24_regular,
                          color: Color(0xFFAAAAAA),
                        ),
                        initialChildSize: 0.8,
                        maxChildSize: 1,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 240, 240, 240),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        searchable: true,
                        buttonText: const Text("Tecnologias"),
                        items: tecnologias
                            .map((e) => MultiSelectItem(e, e.toString()))
                            .toList(),
                        initialValue: tecnologiasSelecionadas,
                        listType: MultiSelectListType.CHIP,
                        onConfirm: (e) => setState(() {
                          tecnologiasSelecionadas = e;
                        }),
                        chipDisplay: MultiSelectChipDisplay.none(),
                      ),
                      tecnologiasSelecionadas.isEmpty
                          ? Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                "Nada selecionado",
                                style: TextStyle(color: Colors.black54),
                              ))
                          : Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 10),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                children: tecnologiasSelecionadas
                                    .map(
                                      (e) => Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: ChipWidget(
                                          label: e,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          onDelete: () {
                                            setState(() {
                                              tecnologiasSelecionadas.remove(e);
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Row(children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          dateController.textController.text = "";
                          dataNascimento = null;
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
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          if (nomeController.text.trim().length < 3 ||
                              dataNascimento == null ||
                              selectedOption == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Dados inválidos",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.deepPurple,
                              ),
                            );
                            return;
                          } else {
                            dateController.textController.text = "";
                            dataNascimento = null;
                            FocusManager.instance.primaryFocus?.unfocus();
                            widget.controller.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.deepPurple,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          "Salvar",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      );
}
