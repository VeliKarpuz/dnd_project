import 'package:dnd_project/constants/enums/backgrounds.dart';
import 'package:dnd_project/constants/enums/clases.dart';
import 'package:dnd_project/constants/enums/races.dart';
import 'package:flutter/material.dart';

class CharController extends ChangeNotifier {
  String charName = '';
  String charRace = Races.human.name;
  String charClass = Classes.bard.name;
  String charBackGround = BackGrounds.acolyte.name;

  setName({required String name}) {
    charName = name;
    notifyListeners();
  }

  updateRace({required String race}) {
    charRace = race;
    notifyListeners();
  }

  updateClass({required String characterClass}) {
    charClass = characterClass;
    notifyListeners();
  }

  updateBackGround({required String backGround}) {
    charBackGround = backGround;
    notifyListeners();
  }
}
