import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dev_quiz/screens/login/login_state.dart';
import 'package:flutter_dev_quiz/shared/models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginController {
  final stateNotifier = ValueNotifier<LoginState>(LoginState.empty);
  set state(LoginState state) => stateNotifier.value = state;
  LoginState get state => stateNotifier.value;
  late UserModel user;

  Future fetchGitHubUser(String name, VoidCallback afterSuccess) async {
    state = LoginState.loading;
    try {
      var response = await http.get(Uri.https('api.github.com', 'users/$name'));
      Map map = Map<String, dynamic>.from(json.decode(response.body));
      if (response.statusCode != 200) throw response;
      user =
          UserModel(name: map['name'], photoUrl: map['avatar_url'], score: 100);
      afterSuccess();
    } catch (e) {
      print(e);
      state = LoginState.error;
    }
  }

  createUserByName(String name) async {
    state = LoginState.loading;
    user = UserModel(name: name, photoUrl: "", score: 100);
  }
}
