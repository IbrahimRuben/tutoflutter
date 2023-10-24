import 'package:flutter/material.dart';
import 'package:tutoflutter/pages/menu_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isConnected = false;
  String titleButton = 'Conectar';
  Color colorButton = Colors.red;

  void changeConnected() {
    isConnected = !isConnected;
    setState(() {
      if (isConnected == false) {
        titleButton = 'Conectar';
        colorButton = Colors.red;
      } else {
        titleButton = 'Desconectar';
        colorButton = Colors.green;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MenuPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial Flutter'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: InkWell(
          onTap: changeConnected,
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 120,
            decoration: BoxDecoration(
                color: colorButton,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Text(
              titleButton,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
