import 'package:flutter/material.dart';

class SlideInterface {
  final String imageUrl;
  final String title;
  final String description;
  SlideInterface(
      {@required this.imageUrl,
      @required this.title,
      @required this.description});
}

final sliderData = [
  SlideInterface(
      imageUrl: "assets/images/onboarding/desktop.png",
      title: "Welcome to Whollet",
      description: "Manage all your crypto assets! It’s simple and easy!"),
  SlideInterface(
      imageUrl: "assets/images/onboarding/idea.png",
      title: "Nice and Tidy Crypto Portfolio!",
      description: "Keep BTC, ETH, XRP, and many other ERC-20 based tokens."),
  SlideInterface(
      imageUrl: "assets/images/onboarding/social.png",
      title: "Receive and Send Money to Friends!",
      description:
          "Send crypto to your friends with a personal message attached."),
  SlideInterface(
      imageUrl: "assets/images/onboarding/mobile.png",
      title: "Your Safety is Our Top Priority",
      description:
          "Our top-notch security features will keep you completely safe.")
];
