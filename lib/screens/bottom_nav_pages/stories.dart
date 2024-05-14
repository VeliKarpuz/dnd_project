import 'package:dnd_project/components/my_list_view.dart';
import 'package:dnd_project/components/story_filter_button.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Discover",
            style: TextStyle(fontSize: 40),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StoryFilterButton(
              text: "ALL",
              onPressed: () {},
            ),
            StoryFilterButton(
              text: "DOWNLOADED",
              onPressed: () {},
            ),
            StoryFilterButton(
              text: "OWNED",
              onPressed: () {},
            ),
          ],
        ),
        const MyListView(
          imagePath: adventure,
        )
      ],
    ));
  }
}
