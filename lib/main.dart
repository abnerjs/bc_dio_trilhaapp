import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/pages/home/home_main.dart';
import 'package:todoapp/pages/login.dart';
import 'package:todoapp/pages/profile/profile_main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todoapp/pages/settings/settings_main.dart';

void main() {
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
      },
    );
  }
}
