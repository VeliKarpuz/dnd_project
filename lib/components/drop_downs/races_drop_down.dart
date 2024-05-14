import 'package:dnd_project/constants/enums/races.dart';
import 'package:dnd_project/providers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RacesDropDown extends StatefulWidget {
  const RacesDropDown({super.key});

  @override
  State<RacesDropDown> createState() => _RacesDropDownState();
}

class _RacesDropDownState extends State<RacesDropDown> {
  String raceDropdownValue = Races.human.name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: raceDropdownValue,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: Races.human.name,
            child: Text(Races.human.name),
          ),
          DropdownMenuItem(
            value: Races.elf.name,
            child: Text(Races.elf.name),
          ),
          DropdownMenuItem(
            value: Races.dwarf.name,
            child: Text(Races.dwarf.name),
          ),
          DropdownMenuItem(
            value: Races.dragonBorn.name,
            child: Text(Races.dragonBorn.name),
          ),
          DropdownMenuItem(
            value: Races.halfling.name,
            child: Text(Races.halfling.name),
          ),
        ],
        onChanged: (String? value) {
          setState(
            () {
              raceDropdownValue = value!;
              Provider.of<CharController>(context, listen: false)
                  .updateRace(race: raceDropdownValue);
            },
          );
        },
      ),
    );
  }
}
