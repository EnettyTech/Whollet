import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF1f9),
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        "Welcome Back!",
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Image.asset(
                      "assets/images/login/login.png",
                      alignment: Alignment.center,
                    )
                  ],
                )),
            Expanded(
              flex: 5,
              child: FormInput(),
            )
          ],
        ),
      ),
    );
  }
}

class FormInput extends StatefulWidget {
  FormInput({Key key}) : super(key: key);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  void initState() {
    super.initState();
    print("SecondRoute: initState");
  }

  @override
  void deactivate() {
    print("SecondRoute: deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("SecondRoute: dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            // bottom: MediaQuery.of(context).padding.bottom,
            right: 40,
            left: 40,
            top: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Email address"),
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
                          style: TextStyle(color: Color(0xFFF347AF0)),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: FlatButton(
                        color: Color(0xFFF347AF0),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                      ),
                    ),
                    Container(
                        child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              ))
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
