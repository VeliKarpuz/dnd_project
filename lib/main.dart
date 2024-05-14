import 'package:dnd_project/constants/strings.dart';
import 'package:dnd_project/providers/char_controller.dart';
import 'package:dnd_project/providers/char_page_controller.dart';
import 'package:dnd_project/providers/stats_controller.dart';
import 'package:dnd_project/screens/character_page.dart';
import 'package:dnd_project/screens/first_page.dart';
import 'package:dnd_project/screens/home_page.dart';
import 'package:dnd_project/screens/login_page.dart';
import 'package:dnd_project/screens/new_character.dart';
import 'package:dnd_project/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StatsController>(
          create: (_) => StatsController(),
        ),
        ChangeNotifierProvider<CharController>(
          create: (_) => CharController(),
        ),
        ChangeNotifierProvider<CharPageController>(
          create: (_) => CharPageController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DND",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      routes: {
        firstPage: (context) => const FirstPage(),
        homePage: (context) => const HomePage(),
        newCharacter: (context) => const NewCharacter(),
        characterPage: (context) => const CharacterPage(),
        loginPage: (context) => const LoginPage(),
        registerPage: (context) => const RegisterPage(),
      },
    );
  }
}
