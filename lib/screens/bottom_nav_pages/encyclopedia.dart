import 'package:dnd_project/constants/strings.dart';
import 'package:flutter/material.dart';

class Encyclopedia extends StatelessWidget {
  const Encyclopedia({super.key});

  @override
  Widget build(BuildContext context) {
    String initValue = "Spells";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Encyclopedia",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: initValue,
                  isExpanded: true,
                  elevation: 3,
                  items: const [
                    DropdownMenuItem(
                      value: "Spells",
                      child: Text("Spells"),
                    ),
                    DropdownMenuItem(
                      value: "Races",
                      child: Text("Races"),
                    ),
                    DropdownMenuItem(
                      value: "Items",
                      child: Text("Items"),
                    ),
                    DropdownMenuItem(
                      value: "Classes",
                      child: Text("Classes"),
                    ),
                    DropdownMenuItem(
                      value: "Backgrounds",
                      child: Text("Backgrounds"),
                    ),
                  ],
                  onChanged: (String? value) {
                    value = value;
                  },
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(loginPageAsset),
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              standartText,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text("8th level necromancy")
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
