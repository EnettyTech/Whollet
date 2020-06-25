import 'package:flutter/material.dart';

class SlideImage extends StatelessWidget {
  SlideImage(
      {Key key,
      this.urlImage,
      this.length,
      this.onChangePage,
      this.isShowSkip,
      this.pageController})
      : super(key: key);
  final bool isShowSkip;
  final String urlImage;
  final int length;
  final onChangePageCallBack onChangePage;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    double StatusBarHeigh = MediaQuery.of(context).padding.top;
//    final PageController _pageController = PageController();

    return new Expanded(
      flex: 5,
      child: new Container(
        padding: new EdgeInsets.only(top: StatusBarHeigh),
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: isShowSkip
                  ? Align(
                      alignment: Alignment.topRight,
                      child: new ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  color: Color(0xFF347AF0),
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => pageController.jumpToPage(length),
                          )
                        ],
                      ),
                    )
                  : new Align(),
            ),
            new Expanded(
                flex: 8,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  itemCount: length,
                  itemBuilder: (ctx, i) => Item(
                    urlImage: urlImage,
                  ),
                  onPageChanged: (index) => onChangePage(index),
                ))
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String urlImage;
  Item({this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      urlImage,
      alignment: Alignment.center,
//        fit: BoxFit.fill,
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width / 2,
    );
  }
}

typedef onChangePageCallBack = void Function(int);
