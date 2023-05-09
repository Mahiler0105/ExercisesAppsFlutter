import 'package:flutter/material.dart';

enum Transport { car, airplane, bicycle }

class UiControlsScreen extends StatefulWidget {
  static const String name = "ui_controls_screen";

  const UiControlsScreen({super.key});

  @override
  State<UiControlsScreen> createState() => _UiControlsScreenState();
}

class _UiControlsScreenState extends State<UiControlsScreen> {
  bool switchValue = false;
  Transport selectedTransportation = Transport.bicycle;
  bool breakfast = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UI Controls")),
      body: Column(
        children: [
          SwitchListTile(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = !switchValue;
              });
            },
            title: const Text("Titulo"),
            subtitle: const Text('Subtitulo'),
          ),
          ExpansionTile(title: const Text("Vehiculos"), children: [
            RadioListTile(
                title: const Text("Carro"),
                subtitle: const Text("Descripción"),
                value: Transport.car,
                groupValue: selectedTransportation,
                onChanged: (_) {
                  setState(() {
                    selectedTransportation = Transport.car;
                  });
                }),
            RadioListTile(
                title: const Text("Bicicleta"),
                subtitle: const Text("Descripción"),
                value: Transport.bicycle,
                groupValue: selectedTransportation,
                onChanged: (_) {
                  setState(() {
                    selectedTransportation = Transport.bicycle;
                  });
                }),
            RadioListTile(
                title: const Text("Avión"),
                subtitle: const Text("Descripción"),
                value: Transport.airplane,
                groupValue: selectedTransportation,
                onChanged: (_) {
                  setState(() {
                    selectedTransportation = Transport.airplane;
                  });
                }),
          ]),
          CheckboxListTile(
              title: const Text("Desayuno?"),
              value: breakfast,
              onChanged: (_) {
                setState(() {
                  breakfast = !breakfast;
                });
              }),
          CheckboxListTile(
              title: const Text("Cena?"),
              value: dinner,
              onChanged: (_) {
                setState(() {
                  dinner = !dinner;
                });
              })
        ],
      ),
    );
  }
}
