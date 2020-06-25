import 'package:flutter/material.dart';
import 'package:whollet/screens/onboarding.dart';
import 'package:redux/redux.dart';
import 'package:whollet/models/app_state.dart';
import 'package:whollet/redux/reducers/index.dart';

void main() {
  final _initialState = AppState(login: null);
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);
  runApp((Onboarding(store: _store)));
}
