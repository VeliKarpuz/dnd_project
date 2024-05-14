import 'package:flutter/material.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
    required this.upperText,
    required this.lowerText,
  });

  final String upperText, lowerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Column(
        children: [
          Text(
            upperText,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(lowerText)
        ],
      ),
    );
  }
}
