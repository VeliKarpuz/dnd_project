import 'package:dnd_project/components/char_page_button.dart';
import 'package:dnd_project/components/char_page_sections/char_notes.dart';
import 'package:dnd_project/components/char_page_sections/char_skills.dart';
import 'package:dnd_project/components/char_page_sections/char_spells.dart';
import 'package:dnd_project/components/char_page_sections/char_stats.dart';
import 'package:dnd_project/components/char_page_sections/skill_header.dart';
import 'package:dnd_project/components/text_column.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:dnd_project/providers/char_controller.dart';
import 'package:dnd_project/providers/char_page_controller.dart';
import 'package:dnd_project/providers/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CharPageController controller =
        Provider.of<CharPageController>(context, listen: false);
    int pageNumber = Provider.of<CharPageController>(context).charPageNumber;
    final StatsController statsProvider = Provider.of<StatsController>(context);
    final CharController charProvider = Provider.of<CharController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            child: Column(
              children: [
                TextColumn(
                    upperText: charProvider.charName,
                    lowerText:
                        "${charProvider.charRace}   ||  ${charProvider.charClass}"),
                SizedBox(
                  height: size.width * 0.3,
                  width: size.width * 0.3,
                  child: Image.asset(loginPageAsset),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextColumn(
                      upperText: "+1",
                      lowerText: "Prof Bonus",
                    ),
                    TextColumn(
                      upperText: "30 ft",
                      lowerText: "Walking Speed",
                    ),
                    TextColumn(
                      upperText: "+3",
                      lowerText: "Initiative",
                    ),
                    TextColumn(
                      upperText: "14",
                      lowerText: "Armor Class",
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  CharPageButton(
                      text: "Stats",
                      pageNumber: 1,
                      onPressed: () => controller.setCharPageNumber(1)),
                  CharPageButton(
                      text: "Skills",
                      pageNumber: 2,
                      onPressed: () => controller.setCharPageNumber(2)),
                  CharPageButton(
                      text: "Spells",
                      pageNumber: 3,
                      onPressed: () => controller.setCharPageNumber(3)),
                  CharPageButton(
                      text: "Notes",
                      pageNumber: 4,
                      onPressed: () => controller.setCharPageNumber(4)),
                ],
              ),
              SizedBox(
                child: () {
                  switch (pageNumber) {
                    case 1:
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CharStats(
                                  title: "STRENGTH",
                                  modifier: 2,
                                  stat: statsProvider.strength),
                              CharStats(
                                  title: "dexterity".toUpperCase(),
                                  modifier: 2,
                                  stat: statsProvider.dexterity)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CharStats(
                                  title: "constitution".toUpperCase(),
                                  modifier: 2,
                                  stat: statsProvider.constitution),
                              CharStats(
                                  title: "intelligence".toUpperCase(),
                                  modifier: 2,
                                  stat: statsProvider.intelligence)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CharStats(
                                  title: "wisdom".toUpperCase(),
                                  modifier: 2,
                                  stat: statsProvider.wisdom),
                              CharStats(
                                  title: "charisma".toUpperCase(),
                                  modifier: 2,
                                  stat: statsProvider.charisma)
                            ],
                          ),
                        ],
                      );
                    case 2:
                      return const Column(
                        children: [
                          SkillHeader(),
                          CharSkills(
                              text: "0",
                              text2: "DEX",
                              text3: "Acrobatics",
                              text4: "+3"),
                          CharSkills(
                              text: "1",
                              text2: "STR",
                              text3: "Animal Handling",
                              text4: "+1"),
                          CharSkills(
                              text: "1",
                              text2: "INT",
                              text3: "Arcana",
                              text4: "+3"),
                          CharSkills(
                              text: "0",
                              text2: "STR",
                              text3: "Athletics",
                              text4: "+2")
                        ],
                      );
                    case 3:
                      return CharSpells();
                    case 4:
                      return CharNotes();
                  }
                }(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
