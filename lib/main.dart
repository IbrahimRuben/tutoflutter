import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoflutter/pages/intro_page.dart';
import 'package:tutoflutter/services/my_mqtt_client.dart';
import 'package:tutoflutter/services/table_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TableInput(),
        ),
        ChangeNotifierProvider(
          create: (context) => MQTTClientWrapper(),
        )
      ],
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
