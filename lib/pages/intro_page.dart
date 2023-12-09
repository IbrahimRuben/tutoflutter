import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoflutter/pages/menu_page.dart';
import 'package:tutoflutter/services/my_mqtt_client.dart';
import 'package:tutoflutter/services/socket_service.dart';

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

  void connectMQTT() async {
    if (isConnected == false) {
      bool canConnect =
          await Provider.of<MQTTClientWrapper>(context, listen: false)
              .connectMqttClient();
      if (canConnect) {
        Provider.of<SocketService>(context, listen: false).setContext(context);
        Provider.of<SocketService>(context, listen: false).initSocket();
        changeConnected();
      } else {
        print('Error en la conexión');
      }
    } else {
      Provider.of<MQTTClientWrapper>(context, listen: false)
          .client
          .disconnect();
      changeConnected();
    }
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
          onTap: connectMQTT,
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
