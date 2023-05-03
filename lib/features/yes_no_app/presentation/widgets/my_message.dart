import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  final String message;

  const MyMessage({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(decoration: BoxDecoration(
            color: colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(2),
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20))
        ),child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(message, style: const TextStyle(
            color: Colors.white,
          ),),
        )),
        const SizedBox(height: 7)
      ],
    );
  }
}
