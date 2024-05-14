import 'dart:math';

import 'package:flutter/material.dart';

class StatsController extends ChangeNotifier {
  int strength = 8;
  int dexterity = 8;
  int constitution = 8;
  int intelligence = 8;
  int wisdom = 8;
  int charisma = 8;

  void updateStat({required String statName, required bool increase}) {
    int Function(int) updateFunction =
        increase ? (val) => min(val + 1, 20) : (val) => max(val - 1, 8);

    switch (statName.toLowerCase()) {
      case "strength":
        strength = updateFunction(strength);
        break;
      case "dexterity":
        dexterity = updateFunction(dexterity);
        break;
      case "constitution":
        constitution = updateFunction(constitution);
        break;
      case "intelligence":
        intelligence = updateFunction(intelligence);
        break;
      case "wisdom":
        wisdom = updateFunction(wisdom);
        break;
      case "charisma":
        charisma = updateFunction(charisma);
        break;
      default:
        throw Exception("Invalid stat name: $statName");
    }
    notifyListeners();
  }

  void increaseStat({required String statName}) {
    updateStat(statName: statName, increase: true);
  }

  void decreaseStat({required String statName}) {
    updateStat(statName: statName, increase: false);
  }
}
