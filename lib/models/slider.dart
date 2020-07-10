import 'package:flutter/material.dart';
import '../utilities/images.dart';

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
      imageUrl: ImageApp().onboarding_desktop,
      title: "Welcome to Whollet",
      description: "Manage all your crypto assets! It’s simple and easy!"),
  SlideInterface(
      imageUrl: ImageApp().onboarding_idea,
      title: "Nice and Tidy Crypto Portfolio!",
      description: "Keep BTC, ETH, XRP, and many other ERC-20 based tokens."),
  SlideInterface(
      imageUrl: ImageApp().onboarding_social,
      title: "Receive and Send Money to Friends!",
      description:
          "Send crypto to your friends with a personal message attached."),
  SlideInterface(
      imageUrl: ImageApp().onboarding_omobile,
      title: "Your Safety is Our Top Priority",
      description:
          "Our top-notch security features will keep you completely safe.")
];
