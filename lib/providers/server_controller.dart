import 'package:dnd_project/models/character.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServerController {
  static final ServerController _singleton = ServerController._internal();

  factory ServerController() {
    return _singleton;
  }

  ServerController._internal();

  String _token = "";

  String getToken() {
    return _token;
  }

  setToken({required String token}) {
    _token = token;
    print(token);
  }

  String endPoint = "172.20.10.2";
  String port = "80";

  String get url => "http://$endPoint:$port";

  Future<List<String>> sendGetRequest() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<String> newData = [];
      jsonData.forEach((key, value) {
        newData.add('$key: $value');
      });

      return newData;
    } else {
      return ['Failed to load data'];
    }
  }

  Future<List<String>> sendSignUpPostRequest(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$url/user/signup"),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<String> newData = [];
        jsonData.forEach((key, value) {
          newData.add('$key: $value');
        });
        return newData;
      } else {
        return [
          'Failed to load data, status code: ${response.statusCode}. Please check the server logs for more details.'
        ];
      }
    } catch (e) {
      print(e.toString());
      return ['Error occurred while sending POST request'];
    }
  }

  Future<List<String>> sendLogInPostRequest(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$url/user/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        String token = jsonData['token'];
        setToken(token: jsonDecode(token));
        print(getToken());
        return [];
      } else {
        return [
          'Failed to load data, status code: ${response.statusCode}. Please check the server logs for more details.'
        ];
      }
    } catch (e) {
      print(e.toString());
      return ['Error occurred while sending POST request'];
    }
  }

  Future<List<String>> saveCharRequest(Character character) async {
    try {
      final response = await http.post(
        Uri.parse('$url/character/save'),
        body: jsonEncode({
          "userId": character.userId,
          "character_name": character.characterName,
          "char_class": character.charClass,
          "race": character.race,
          "level": character.level,
          "background": character.background,
          "alignment": character.alignment,
          "experience_points": character.experiencePoint,
          "current_hit_points": character.currentHitPoint,
          "max_hit_points": character.maxHitPoint,
          "armor_class": character.armorClass,
          "speed": character.speed,
        }),
        headers: {
          'Content-Type': 'application/json',
          'authorization':
              "eyJhbGciOiJSUzI1NiIsImtpZCI6ImEyMzhkZDA0Y2JhYTU4MGIzMDRjODgxZTFjMDA4ZWMyOGZiYmFkZGMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZmlyLWF1dGgtZGVtby0zOGMxNSIsImF1ZCI6ImZpci1hdXRoLWRlbW8tMzhjMTUiLCJhdXRoX3RpbWUiOjE3MTQyMjY2ODAsInVzZXJfaWQiOiJrY3pJbXB6bnFTaE83SjhDVVVOQlBCWUdlSmoyIiwic3ViIjoia2N6SW1wem5xU2hPN0o4Q1VVTkJQQllHZUpqMiIsImlhdCI6MTcxNDIyNjY4MCwiZXhwIjoxNzE0MjMwMjgwLCJlbWFpbCI6Im1lcnZlQGVtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJtZXJ2ZUBlbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.OFKHbxn6btzM2cpIFSp9JjME8MztVtqH-AN6GxjN2QvP1cRi4oacsfGMliy54R3F0L4latCTo0yHgzckQ2MsUogFYfUGJ4pIYmSi-57KriEMu05Rf0RrabTc02GeuUDiHk6ieg6K_8wzqWQq_J4wRmAu_AiVxKHM4Y909e207mRakmPJi9VJilngIeZ7eSwXAyXcBGzQdiN96fqo1NAnej3uKguK_Yw-2Q5T0hw2rLuSZ1fiTqYGq5AQE_rVCkv1SvUTkcEBeOyJnyGPFLpOKB-Zhb96nku-ViXLYhsG37BtdI3_jzf3tQ5Ca45MB62oviGJPIZETpCOUEakJq6-4w",
        },
      );
      if (response.statusCode == 200) {
        print(_token);
        return [_token];
      } else {
        print("Expecto Patronum!");
        return [
          'Failed to load data, status code: ${response.statusCode}. Please check the server logs for more details.'
        ];
      }
    } catch (e) {
      print(e.toString());
      return ['Error occurred while sending POST request'];
    }
  }

  Future<List<dynamic>> fetchCharacters() async {
    final response = await http.get(Uri.parse(url), headers: {
      'authorization':
          "eyJhbGciOiJSUzI1NiIsImtpZCI6ImEyMzhkZDA0Y2JhYTU4MGIzMDRjODgxZTFjMDA4ZWMyOGZiYmFkZGMiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZmlyLWF1dGgtZGVtby0zOGMxNSIsImF1ZCI6ImZpci1hdXRoLWRlbW8tMzhjMTUiLCJhdXRoX3RpbWUiOjE3MTQyMjY2ODAsInVzZXJfaWQiOiJrY3pJbXB6bnFTaE83SjhDVVVOQlBCWUdlSmoyIiwic3ViIjoia2N6SW1wem5xU2hPN0o4Q1VVTkJQQllHZUpqMiIsImlhdCI6MTcxNDIyNjY4MCwiZXhwIjoxNzE0MjMwMjgwLCJlbWFpbCI6Im1lcnZlQGVtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJtZXJ2ZUBlbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.OFKHbxn6btzM2cpIFSp9JjME8MztVtqH-AN6GxjN2QvP1cRi4oacsfGMliy54R3F0L4latCTo0yHgzckQ2MsUogFYfUGJ4pIYmSi-57KriEMu05Rf0RrabTc02GeuUDiHk6ieg6K_8wzqWQq_J4wRmAu_AiVxKHM4Y909e207mRakmPJi9VJilngIeZ7eSwXAyXcBGzQdiN96fqo1NAnej3uKguK_Yw-2Q5T0hw2rLuSZ1fiTqYGq5AQE_rVCkv1SvUTkcEBeOyJnyGPFLpOKB-Zhb96nku-ViXLYhsG37BtdI3_jzf3tQ5Ca45MB62oviGJPIZETpCOUEakJq6-4w",
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> newData = [];
      jsonData.forEach((key, value) {
        newData.add('$key: $value');
      });

      return newData;
    } else {
      return ['Failed to load data'];
    }
  }
}
