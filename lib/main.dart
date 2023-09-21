import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/pages/home/category/card_detail.dart';
import 'package:todoapp/pages/home/home_main.dart';
import 'package:todoapp/pages/login.dart';
import 'package:todoapp/pages/profile/profile_main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoapp/pages/settings/settings_main.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;

Map<int, String> scripts = {
  1: '''CREATE TABLE IF NOT EXISTS categories(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          startColor TEXT,
          endColor TEXT)''',
  2: '''CREATE TABLE IF NOT EXISTS task(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          description TEXT,
          date TEXT,
          categoryId INTEGER,
          FOREIGN KEY(categoryId) REFERENCES categories(id) 
  )''',
};

Future initDatabase() async {
  // ignore: unused_local_variable
  var db = await openDatabase(
    path.join(await getDatabasesPath(), 'todo.db'),
    version: 1,
    onCreate: (db, version) {
      scripts.forEach((key, value) async {
        await db.execute(value);
      });
    },
    onUpgrade: (db, oldVersion, newVersion) => {
      if (oldVersion < newVersion)
        {
          scripts.forEach((key, value) async {
            if (key > oldVersion) await db.execute(value);
          })
        }
    },
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  path_provider.getApplicationDocumentsDirectory().then((dir) {
    var documentPath = dir.path;
    Hive.init(documentPath);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratTextTheme(),
          primarySwatch: Colors.deepPurple),
      home: const LoginPage(title: 'Noted'),
      routes: <String, WidgetBuilder>{
        '/home': (context) => const HomePageMain(title: 'Olá, Abner!'),
        '/profile': (context) => const ProfilePageMain(title: 'Perfil'),
        '/settings': (context) =>
            const SettingsPageMain(title: 'Configurações'),
        '/card-detail': (context) => const CardDetail(),
      },
    );
  }
}
