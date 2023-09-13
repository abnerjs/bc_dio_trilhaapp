import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/model/settings.dart';
import 'package:todoapp/repository/settings.dart';
import 'package:todoapp/widgets/menu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsRepository settingsRepository;
  var settings = Settings.empty();
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    settingsRepository = await SettingsRepository.init();
    settings = settingsRepository.getSettings();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: const MenuWidget(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'Tema escuro',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              trailing: Switch(
                value: settings.isDarkMode,
                onChanged: (value) {
                  setState(() {
                    settings.isDarkMode = value;
                  });
                  settingsRepository.setSettings(settings);
                },
              ),
            ),
            ListTile(
              title: Text(
                'Notificações',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                ),
              ),
              trailing: Switch(
                value: settings.isNotificationEnabled,
                onChanged: (value) {
                  setState(() {
                    settings.isNotificationEnabled = value;
                  });
                  settingsRepository.setSettings(settings);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
