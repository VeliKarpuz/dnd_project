import 'package:dnd_project/components/login_button.dart';
import 'package:dnd_project/components/my_other_list_view.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:flutter/material.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Characters",
            style: TextStyle(fontSize: 40),
          ),
          MyOtherListView(imagePath: avatar),
          LoginButton(
              foregroundColor: Colors.black,
              backgroundColor: Colors.red,
              text: "Create New Character",
              page: newCharacter)
        ],
      ),
    );
  }
}
