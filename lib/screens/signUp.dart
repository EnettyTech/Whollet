import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keyboard_utils/keyboard_options.dart';
import 'package:keyboard_utils/keyboard_utils.dart';
import 'package:keyboard_utils/keyboard_listener.dart';
import 'package:keyboard_utils/widgets.dart';
import 'package:whollet/utilities/images.dart';

class KeyboardBloc {
  KeyboardUtils _keyboardUtils = KeyboardUtils();
  StreamController<double> _streamController = StreamController<double>();
  Stream<double> get stream => _streamController.stream;

  KeyboardUtils get keyboardUtils => _keyboardUtils;

  int _idKeyboardListener;

  void start() {
    _idKeyboardListener = _keyboardUtils.add(
        listener: KeyboardListener(willHideKeyboard: () {
      _streamController.sink.add(_keyboardUtils.keyboardHeight);
    }, willShowKeyboard: (double keyboardHeight) {
      _streamController.sink.add(keyboardHeight);
    }));
  }

  void dispose() {
    _keyboardUtils.unsubscribeListener(subscribingId: _idKeyboardListener);
    if (_keyboardUtils.canCallDispose()) {
      _keyboardUtils.dispose();
    }
    _streamController.close();
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEDF1f9),
        body: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 50),
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Image.asset(
                          ImageApp().signUp_office,
                          alignment: Alignment.center,
                        )
                      ],
                    ))
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(child: KeyboardAware(
                builder: (context, keyboardConfig) {
                  return FormInput(keyboardConfig: keyboardConfig);
                },
              )),
            )
          ]),
        ));
  }
}

class FormInput extends StatefulWidget {
  FormInput({Key key, this.keyboardConfig}) : super(key: key);
  final KeyboardOptions keyboardConfig;
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Container(),
          ),
          Expanded(
              flex: 5,
              child: Transform.translate(
                offset: Offset(0, -widget.keyboardConfig.keyboardHeight),
                child: Container(
                    padding: EdgeInsets.only(
                      right: 40,
                      left: 40,
                      top: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              TextField(
                                decoration:
                                    InputDecoration(labelText: "Email address"),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () => {},
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot your password?",
                                      style:
                                          TextStyle(color: Color(0xFFF347AF0)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  child: FlatButton(
                                    color: Color(0xFFF347AF0),
                                    onPressed: () {},
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 80, vertical: 20),
                                  ),
                                ),
                                Container(
                                    child: MaterialButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Don't have an account?",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal)),
                                      Text(" Sign up",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFFF347AF0),
                                            fontWeight: FontWeight.w900,
                                          )),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
