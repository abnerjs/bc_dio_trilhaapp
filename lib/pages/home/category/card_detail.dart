import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/model/card_data.dart';
import 'package:todoapp/model/task_list.dart';
import 'package:todoapp/repository/task_list_repository.dart';
import 'package:todoapp/utils/blended_color_pallete.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  var tasklistRepository = TaskListRepository();
  List<Color> colors = [];
  var rng = Random();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CardData;
    var labelController = TextEditingController();
    int? selectedIndex = 1;

    return Hero(
      tag: args.label,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: const Text("Todos"),
                      selected: selectedIndex == 1,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: const Text("Não concluídos"),
                      selected: selectedIndex == 2,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                itemCount: tasklistRepository.taskLists.length,
                itemBuilder: (context, index) {
                  var taskList = tasklistRepository.taskLists[index];
                  var backgroundColor = generateBrighterMonochromaticPalette(
                      args.colors, 10)[rng.nextInt(10)];

                  return noteAdded(
                      taskList, backgroundColor, tasklistRepository);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: args.colors,
            ),
            boxShadow: [
              BoxShadow(
                color: args.colors[0].withOpacity(0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: FloatingActionButton(
            heroTag: null,
            elevation: 0,
            highlightElevation: 0,
            focusElevation: 0,
            onPressed: () async {
              tasklistRepository.addTaskList(
                TaskList('', DateTime.now(), false, false),
              );
              labelController.text = "";

              setState(() {});
            },
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            splashColor: Colors.transparent,
            child: const Icon(FluentIcons.add_24_regular),
          ),
        ),
      ),
    );
  }
}

Widget noteAdded(TaskList taskList, Color backgroundColor,
    TaskListRepository tasklistRepository) {
  return Dismissible(
    key: Key(taskList.id),
    direction: DismissDirection.startToEnd,
    onDismissed: (direction) {
      tasklistRepository.removeTaskList(taskList);
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Digite o título',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                taskList.title = value;
                tasklistRepository.updateTaskList(taskList);
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(FluentIcons.chevron_right_24_regular),
          ),
        ],
      ),
    ),
  );
}
