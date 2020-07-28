import 'package:flutter/material.dart';
import 'package:whollet/classes/stateApp.dart';
import 'package:whollet/screens/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:whollet/models/app_state.dart';
import 'package:whollet/screens/login.dart';
import 'package:whollet/screens/signUp.dart';
import 'package:whollet/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
        value: InitProvider()..init(),
        child: MaterialApp(
            themeMode: ThemeMode.dark,
            title: "",
            initialRoute: '/',
            routes: {
              '/welcome': (context) => Welcome(),
              '/login': (context) => LoginScreen(),
              '/signUp': (context) => SignUpScreen(),
              '/onboarding': (context) => Onboarding()
            },
            home: Consumer<InitProvider>(builder: (context, model, child) {
              if (model?.stateApp == null) {
                return (Center(
                  child: CircularProgressIndicator(),
                ));
              }
              if (model.stateApp.isEmpty) {
                return (Onboarding());
              }
              return (Welcome());
            })));
  }
}
