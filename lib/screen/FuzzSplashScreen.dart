import 'package:flutter/material.dart';
import 'package:fuzz/screen/FuzzWalkThrough.dart';
import 'package:fuzz/utils/FuzzImages.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await 3.seconds.delay;
     const FoodWalkThrough().launch(context, isNewTask: true);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        food_logo,
        width: 120,
        height: 120,
        alignment: Alignment.center,
      ).cornerRadiusWithClipRRect(60).center(),
    );
  }
}
