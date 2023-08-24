import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/home/home_main.dart';
import 'package:trilhaapp/pages/login.dart';
// import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
