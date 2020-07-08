import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input(
      {Key key,
      this.value,
      this.isPassword,
      this.onChangeText,
      this.placeholder})
      : super(key: key);
  final String value;
  final bool isPassword;
  final String placeholder;
  final onChangeTextCallback onChangeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: onChangeText,
        decoration: InputDecoration(labelText: placeholder),
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      ),
    );
  }
}

typedef onChangeTextCallback = void Function(String);
