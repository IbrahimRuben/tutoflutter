import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoflutter/services/my_mqtt_client.dart';

class ParametersPage extends StatefulWidget {
  const ParametersPage({super.key});

  @override
  State<ParametersPage> createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametersPage> {
  List<String> options = ['Madrid', 'Barcelona', 'Granada', 'Bilbao'];
  late String currentOption;
  bool? isUno = false, isDos = false, isTres = false, isCuatro = false;
  double sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    currentOption = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Parameters'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(child: Text('Radio Group')),
                ListTile(
                  title: const Text('Madrid'),
                  leading: Radio(
                    value: options[0],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Barcelona'),
                  leading: Radio(
                    value: options[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Granada'),
                  leading: Radio(
                    value: options[2],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Bilbao'),
                  leading: Radio(
                    value: options[3],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Center(child: Text('CheckBox group')),
                CheckboxListTile(
                  title: const Text('Uno'),
                  value: isUno,
                  onChanged: (value) {
                    setState(() {
                      isUno = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Dos'),
                  value: isDos,
                  onChanged: (value) {
                    setState(() {
                      isDos = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Tres'),
                  value: isTres,
                  onChanged: (value) {
                    setState(() {
                      isTres = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Cuatro'),
                  value: isCuatro,
                  onChanged: (value) {
                    setState(() {
                      isCuatro = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Center(child: Text('Slider Bar')),
                Slider(
                  divisions: 100,
                  min: 0,
                  max: 100,
                  label: sliderValue.toStringAsFixed(0),
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value.roundToDouble();
                    });
                  },
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    List<String> checkBoxResult = [];
                    if (isUno!) {
                      checkBoxResult.add('Uno');
                    }
                    if (isDos!) {
                      checkBoxResult.add('Dos');
                    }
                    if (isTres!) {
                      checkBoxResult.add('Tres');
                    }
                    if (isCuatro!) {
                      checkBoxResult.add('Cuatro');
                    }
                    //String message =
                    //    'Ciudad: $currentOption, CheckBox: $checkBoxResult, Slider Bar: $sliderValue';
                    //print(message);
                    Map<String, dynamic> message = {
                      'Radio Group': currentOption,
                      'CheckBox Group': checkBoxResult,
                      'Slider Bar': sliderValue,
                    };
                    String jsonMessage = jsonEncode(message);
                    Provider.of<MQTTClientWrapper>(context, listen: false)
                        .publishMessage(jsonMessage, 'writeParameters');
                  },
                  child: Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
