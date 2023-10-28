import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutoflutter/modules/item_table.dart';
import 'package:tutoflutter/services/table_input.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Input Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              MyInputField(title: 'Name: ', controller: nameController),
              const SizedBox(height: 10),
              MyInputField(title: 'Age:    ', controller: ageController),
              const SizedBox(height: 60),
              InkWell(
                onTap: () {
                  try {
                    int age = int.parse(ageController.text);
                    print(ageController.text);
                    Provider.of<TableInput>(context, listen: false)
                        .addItemTable(
                      ItemTable(
                        name: nameController.text,
                        age: age,
                      ),
                    );
                    nameController.clear();
                    ageController.clear();
                    print('Valor enviado');
                  } catch (e) {
                    print('El valor no es un numero: $e');
                  }
                },
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Enter new user',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.5,
                child: Consumer<TableInput>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.tableList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              '${value.tableList[index].name}, ${value.tableList[index].age}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline_outlined),
                            onPressed: () =>
                                value.removeItemTable(value.tableList[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const MyInputField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
          ),
        )
      ],
    );
  }
}
