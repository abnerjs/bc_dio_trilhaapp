import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/home/home_main.dart';
import 'package:trilhaapp/pages/login.dart';
import 'package:trilhaapp/pages/profile/profile_main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      home: const LoginPage(title: 'TrilhaApp'),
      routes: <String, WidgetBuilder>{
        '/home': (context) => const HomePageMain(title: 'TrilhaApp'),
        '/profile': (context) => const ProfilePageMain(title: 'Perfil'),
      },
    );
  }
}
