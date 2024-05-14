import 'package:flutter/material.dart';

class SkillHeader extends StatelessWidget {
  const SkillHeader({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.1,
        ),
        Text(
          "PROF",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: size.width * 0.1,
        ),
        Text(
          "MOD",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: size.width * 0.15),
        Text(
          "SKILL",
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "BONUS",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(width: size.width * 0.05),
      ],
    );
  }
}
