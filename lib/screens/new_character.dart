import 'package:dnd_project/components/drop_downs/back_grounds_drop_down.dart';
import 'package:dnd_project/components/drop_downs/class_drop_down.dart';
import 'package:dnd_project/components/drop_downs/races_drop_down.dart';
import 'package:dnd_project/components/stats_card.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:dnd_project/models/character.dart';
import 'package:dnd_project/providers/char_controller.dart';
import 'package:dnd_project/providers/server_controller.dart';
import 'package:dnd_project/providers/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCharacter extends StatefulWidget {
  const NewCharacter({super.key});

  @override
  State<NewCharacter> createState() => _NewCharacterState();
}

class _NewCharacterState extends State<NewCharacter> {
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  TextEditingController nameController =
      TextEditingController(text: "Player 1");
  @override
  Widget build(BuildContext context) {
    CharController charProvider = Provider.of<CharController>(context);
    Character character = Character(
      userId: 1,
      characterName: charProvider.charName,
      charClass: charProvider.charClass,
      level: 1,
      background: charProvider.charBackGround,
      race: charProvider.charRace,
      alignment: "TrueNeutral",
      experiencePoint: 30,
      currentHitPoint: 30,
      maxHitPoint: 30,
      armorClass: 30,
      speed: 30,
    );

    StatsController provider = Provider.of<StatsController>(context);
    StatsController controller =
        Provider.of<StatsController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Character"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) =>
                    Provider.of<CharController>(context, listen: false)
                        .setName(name: value),
                maxLength: 20,
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const ClassDropDown(),
            const RacesDropDown(),
            const BackgroundsDropDown(),
            StatsCard(
              name: "Strength",
              value: provider.strength,
              increase: () {
                controller.updateStat(statName: "Strength", increase: true);
              },
              decrease: () {
                controller.updateStat(statName: "Strength", increase: false);
              },
            ),
            StatsCard(
              name: "Dexterity",
              value: provider.dexterity,
              increase: () {
                controller.updateStat(statName: "Dexterity", increase: true);
              },
              decrease: () {
                controller.updateStat(statName: "Dexterity", increase: false);
              },
            ),
            StatsCard(
              name: "Constitution",
              value: provider.constitution,
              increase: () {
                controller.updateStat(statName: "Constitution", increase: true);
              },
              decrease: () {
                controller.updateStat(
                    statName: "Constitution", increase: false);
              },
            ),
            StatsCard(
              name: "Intelligence",
              value: provider.intelligence,
              increase: () {
                controller.updateStat(statName: "Intelligence", increase: true);
              },
              decrease: () {
                controller.updateStat(
                    statName: "Intelligence", increase: false);
              },
            ),
            StatsCard(
              name: "Wisdom",
              value: provider.wisdom,
              increase: () {
                controller.updateStat(statName: "Wisdom", increase: true);
              },
              decrease: () {
                controller.updateStat(statName: "Wisdom", increase: false);
              },
            ),
            StatsCard(
              name: "Charisma",
              value: provider.charisma,
              increase: () {
                controller.updateStat(statName: "Charisma", increase: true);
              },
              decrease: () {
                controller.updateStat(statName: "Charisma", increase: false);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // print(character.characterName);
                  // Provider.of<CharController>(context, listen: false)
                  //     .setName(name: nameController.text);
                  // final serverController = ServerController();

                  // await serverController.saveCharRequest(character);

                  Navigator.pushNamed(context, characterPage);
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(5),
                    ),
                  ),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(double.maxFinite, 100),
                ),
                child: const Text(
                  "Oluştur",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
