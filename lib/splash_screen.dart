import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:object_detection_app/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/logo.png"),
      backgroundImage: Image.asset("assets/back.jpg").image,
      durationInSeconds: 6,
      navigator: HomePage(),
      showLoader: true,
      loaderColor: Colors.lightBlue,
      loadingText: Text("Loading...", style: TextStyle(color: Colors.white)),
    );
  }
}
