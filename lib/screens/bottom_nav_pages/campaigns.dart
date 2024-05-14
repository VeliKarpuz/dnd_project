import 'package:dnd_project/components/my_other_list_view.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:flutter/material.dart';

class Campaigns extends StatelessWidget {
  const Campaigns({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Campaigns",
            style: TextStyle(fontSize: 40),
          ),
          MyOtherListView(imagePath: adventure)
        ],
      ),
    );
  }
}
