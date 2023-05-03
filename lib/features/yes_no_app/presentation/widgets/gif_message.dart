import 'package:flutter/material.dart';

class GifMessage extends StatelessWidget {
  final String imageUrl;

  const GifMessage({
    super.key, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: size.width * 0.7,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Container(
                  height: 150,
                  width: size.width * 0.7,
                  color: colorScheme.secondary,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.background,
                    ),
                  ),
                );
              },
            )),
        const SizedBox(height: 7)
      ],
    );
  }
}
