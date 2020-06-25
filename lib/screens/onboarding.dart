import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:whollet/models/app_state.dart';
import 'package:whollet/screens/login.dart';
import 'package:whollet/screens/welcome.dart';
import 'package:whollet/widgets/slide_dot.dart';
import '../widgets/slide_item.dart';
import '../models/slider.dart';

class Onboarding extends StatefulWidget {
  final Store<AppState> store;
  Onboarding({this.store});
  _OnboardingState createState() => _OnboardingState(store: store);
}

typedef void MyCallback(int foo);

class _OnboardingState extends State<Onboarding> {
  final Store<AppState> store;
  _OnboardingState({this.store});
  int index = 0;
  final PageController pageController = PageController();

  void next() {
    pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void onChangePage(id) {
    setState(() {
      index = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          title: "",
          initialRoute: '/',
          routes: {
            '/welcome': (context) => Welcome(),
            '/login': (context) => LoginScreen()
          },
          home: Scaffold(
              backgroundColor: Color(0xFFEDF1F9),
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark,
                child: Column(
                  children: <Widget>[
                    SlideImage(
                      urlImage: sliderData[index].imageUrl,
                      length: sliderData.length,
                      onChangePage: onChangePage,
                      isShowSkip: index < sliderData.length - 1 ? true : false,
                      pageController: pageController,
                    ),
                    Expanded(
                        flex: 5,
                        child: BodySlide(
                          onPress: next,
                          info: sliderData[index],
                          index: index,
                          length: sliderData.length,
                        ))
                  ],
                ),
              )),
        ));
  }
}

typedef onPressCallBack = void Function();

class BodySlide extends StatelessWidget {
  BodySlide({this.onPress, this.info, this.index, this.length});
  final onPressCallBack onPress;
  var info;
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom, right: 40, left: 40),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < sliderData.length; i++)
                    if (i == index) SlideDots(true) else SlideDots(false)
                ],
              )),
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Text(
                  info.title.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF0D1F3C)),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    info.description.toString(),
                    style: TextStyle(
                      color: Color(0xFF0D1F3C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: FlatButton(
                  onPressed: index < length - 1
                      ? onPress
                      : () {
                          Navigator.pushReplacementNamed(context, '/welcome');
                        },
                  child: Text(
                      index < length - 1 ? 'Next Step' : "Let's Get Started",
                      style: TextStyle(
                          color: index == length - 1
                              ? Colors.white
                              : Color(0xFF347AF0))),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xFF347AF0),
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(23)),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  color:
                      index == length - 1 ? Color(0xFF347AF0) : Color(0x000000),
                ),
              ))
        ],
      ),
    );
  }
}
