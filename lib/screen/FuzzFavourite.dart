import 'package:flutter/material.dart';
import 'package:fuzz/screen/DevScreen.dart';
import 'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzDataGenerator.dart';
import 'package:fuzz/utils/FuzzModel.dart';
import 'package:fuzz/utils/FuzzString.dart';

class FoodFavourite extends StatefulWidget {
  static String tag = '/FoodFavourite';

  const FoodFavourite({super.key});

  @override
  FoodFavouriteState createState() => FoodFavouriteState();
}

class FoodFavouriteState extends State<FoodFavourite> {
  late List<FoodDish> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = addFoodDishData();
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(food_app_background);
    return Scaffold(
      backgroundColor: food_app_background,
      appBar: appBar(context, food_lbl_favourite),
      body: const DevScreen(false),
    );
  }
}
