import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.text,
    required this.page,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final String text;
  final String page;

  @override
  Widget build(BuildContext context) {
    void navigateToPage(String page) {
      Navigator.pushNamed(context, page);
    }

    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(size.width * 0.45, 50),
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          navigateToPage(page);
        },
        child: Text(text),
      ),
    );
  }
}
