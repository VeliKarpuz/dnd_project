import 'package:flutter/material.dart';

class CharSpells extends StatelessWidget {
  const CharSpells({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 250,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "This player can not cast spells or has not picked any spells yet.",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
