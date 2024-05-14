import 'package:flutter/material.dart';

class CharSkills extends StatelessWidget {
  const CharSkills(
      {super.key,
      required this.text,
      required this.text2,
      required this.text3,
      required this.text4});

  final String text;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.1,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Text(
                text2,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: size.width * 0.15),
              Text(
                text3,
                style: TextStyle(fontSize: 20),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Text(
                        text4,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.05),
            ],
          ),
        ),
      ],
    );
  }
}
