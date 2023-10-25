import 'package:flutter/material.dart';
import 'package:tutoflutter/components/my_menu_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false, //NUEVO
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyMenuButton(title: "Alert Dialog", onTap: () {}),
              const SizedBox(height: 40),
              MyMenuButton(title: "Input", onTap: () {}),
              const SizedBox(height: 40),
              MyMenuButton(title: "Get Value", onTap: () {}),
              const SizedBox(height: 40),
              MyMenuButton(title: "Parameters", onTap: () {}),
              const SizedBox(height: 40),
              MyMenuButton(title: "Video", onTap: () {}),
              const SizedBox(height: 40),
              MyMenuButton(title: "Map", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
