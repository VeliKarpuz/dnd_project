import 'package:dnd_project/constants/enums/clases.dart';
import 'package:dnd_project/providers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassDropDown extends StatefulWidget {
  const ClassDropDown({super.key});

  @override
  State<ClassDropDown> createState() => _ClassDropDownState();
}

class _ClassDropDownState extends State<ClassDropDown> {
  String classesDropdownValue = Classes.bard.name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: classesDropdownValue,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: Classes.bard.name,
            child: Text(Classes.bard.name),
          ),
          DropdownMenuItem(
            value: Classes.fighter.name,
            child: Text(Classes.fighter.name),
          ),
          DropdownMenuItem(
            value: Classes.paladin.name,
            child: Text(Classes.paladin.name),
          ),
          DropdownMenuItem(
            value: Classes.ranger.name,
            child: Text(Classes.ranger.name),
          ),
          DropdownMenuItem(
            value: Classes.wizard.name,
            child: Text(Classes.wizard.name),
          ),
        ],
        onChanged: (String? value) {
          setState(
            () {
              classesDropdownValue = value!;
              Provider.of<CharController>(context, listen: false)
                  .updateClass(characterClass: classesDropdownValue);
            },
          );
        },
      ),
    );
  }
}
