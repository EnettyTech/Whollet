import 'package:flutter/material.dart';

class AppState {
  Map login;

  AppState({@required this.login});

  AppState.fromAppState(AppState another) {
    login = another.login;
  }
}
