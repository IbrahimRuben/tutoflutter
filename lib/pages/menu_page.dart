import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoflutter/components/my_menu_button.dart';
import 'package:tutoflutter/pages/input_page.dart';
import 'package:tutoflutter/pages/map_page.dart';
import 'package:tutoflutter/pages/parameters_page.dart';
import 'package:tutoflutter/pages/video_page.dart';
import 'package:tutoflutter/services/my_mqtt_client.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future callAlertDialog() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Salir"),
            content: const Text("Quieres salir de la aplicación?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('Si')),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false, //NUEVO
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyMenuButton(title: "Alert Dialog", onTap: callAlertDialog),
                  const SizedBox(height: 40),
                  MyMenuButton(
                    title: "Input",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InputPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  MyMenuButton(
                      title: "Get Value",
                      onTap: () {
                        List<String> lista = Provider.of<MQTTClientWrapper>(
                                context,
                                listen: false)
                            .listaValueMensajes;
                        if (lista.isNotEmpty) {
                          print(lista.last);
                        } else {
                          print('No hay mensajes');
                        }
                      }),
                  const SizedBox(height: 40),
                  MyMenuButton(
                      title: "Parameters",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParametersPage(),
                          ),
                        );
                      }),
                  const SizedBox(height: 40),
                  MyMenuButton(
                      title: "Video",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoPage(),
                          ),
                        );
                      }),
                  const SizedBox(height: 40),
                  MyMenuButton(
                      title: "Map",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
