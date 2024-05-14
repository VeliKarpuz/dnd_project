import 'package:dnd_project/providers/char_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharPageButton extends StatelessWidget {
  const CharPageButton({
    super.key,
    required this.text,
    required this.pageNumber,
    required this.onPressed,
  });

  final String text;
  final int pageNumber;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    int activeNumber = Provider.of<CharPageController>(context).charPageNumber;
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width * 0.2, size.width * 0.1),
          backgroundColor:
              activeNumber == pageNumber ? Colors.red : Colors.white,
          foregroundColor:
              activeNumber == pageNumber ? Colors.white : Colors.red,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
