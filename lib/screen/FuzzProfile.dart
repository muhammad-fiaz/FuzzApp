import 'package:flutter/material.dart';
import 'package:fuzz/screen/DevScreen.dart';
import  'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzString.dart';


class FoodProfile extends StatefulWidget {
  static String tag = '/FoodProfile';

  const FoodProfile({super.key});

  @override
  FoodProfileState createState() => FoodProfileState();
}

class FoodProfileState extends State<FoodProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_profile),
      body:const DevScreen(false),
    );
  }
}
