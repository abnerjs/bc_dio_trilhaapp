import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var num = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 40, top: 100, left: 40),
                    child: Text(
                      "TrilhaApp",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Bem vindo de volta!",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 40, left: 40, right: 40),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "Faça login para continuar.",
                            style: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 170, 170, 170),
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 240, 240, 240),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        labelText: 'Email',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 240, 240, 240),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        labelText: 'Senha',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          "Entrar",
                          style: GoogleFonts.poppins(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        )),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 40, left: 40, right: 40),
                    child: Row(
                      children: [
                        Text(
                          "Não tem uma conta?",
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          " Cadastre-se ",
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
