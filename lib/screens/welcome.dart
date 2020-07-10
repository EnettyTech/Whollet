import 'package:flutter/material.dart';
import 'package:whollet/utilities/images.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF347AF0),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Image.asset(ImageApp().welcome_logo),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Welcome to',
                                style: TextStyle(
                                    color:
                                        Color.fromRGBO(255, 255, 255, 0.504289),
                                    fontSize: 28),
                              ),
                            ),
                            Center(
                              child: Text(
                                "WHOLLET",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 45),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text('Create Account'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 65, vertical: 20),
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                            Text(" Sign up",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ))
                          ],
                        ),
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
