import 'package:dnd_project/components/story_filter_button.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                          imagePath,
                        )),
                  ),
                ),
                Column(
                  children: [
                    const Text(standartText,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    StoryFilterButton(
                      text: "DOWNLOAD",
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 2,
              indent: 40,
              endIndent: 40,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
