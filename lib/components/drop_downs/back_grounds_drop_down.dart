import 'package:dnd_project/providers/char_controller.dart';
import 'package:flutter/material.dart';
import 'package:dnd_project/constants/enums/backgrounds.dart';
import 'package:provider/provider.dart';

class BackgroundsDropDown extends StatefulWidget {
  const BackgroundsDropDown({super.key});

  @override
  State<BackgroundsDropDown> createState() => _BackgroundsDropDownState();
}

class _BackgroundsDropDownState extends State<BackgroundsDropDown> {
  String backGroundsDropDownValue = BackGrounds.acolyte.name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: backGroundsDropDownValue,
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: BackGrounds.acolyte.name,
            child: Text(BackGrounds.acolyte.name),
          ),
          DropdownMenuItem(
            value: BackGrounds.cityWatch.name,
            child: Text(BackGrounds.cityWatch.name),
          ),
          DropdownMenuItem(
            value: BackGrounds.folkHero.name,
            child: Text(BackGrounds.folkHero.name),
          ),
          DropdownMenuItem(
            value: BackGrounds.criminal.name,
            child: Text(BackGrounds.criminal.name),
          ),
        ],
        onChanged: (String? value) {
          setState(
            () {
              backGroundsDropDownValue = value!;
              Provider.of<CharController>(context, listen: false)
                  .updateBackGround(backGround: backGroundsDropDownValue);
            },
          );
        },
      ),
    );
  }
}
