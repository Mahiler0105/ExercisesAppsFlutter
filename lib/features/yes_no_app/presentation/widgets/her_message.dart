import 'package:flutter/material.dart';

class HerMessage extends StatelessWidget {
  final String message;

  const HerMessage({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )),
        const SizedBox(height: 7)
      ],
    );
  }
}
