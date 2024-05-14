import 'package:dnd_project/components/login_button.dart';
import 'package:dnd_project/constants/strings.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarText),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.8,
            child: Image.asset(
              height: double.infinity,
              loginPageAsset,
              fit: BoxFit.cover,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LoginButton(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                text: login,
                page: loginPage,
              ),
              LoginButton(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                text: register,
                page: registerPage,
              )
            ],
          )
        ],
      ),
    );
  }
}
