import 'package:flutter/material.dart';
import 'package:fuzz/screen/DevScreen.dart';
import 'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzString.dart';

import '../utils/FuzzColors.dart';

class FoodOrder extends StatefulWidget {
  static String tag = '/FoodOrder';

  const FoodOrder({super.key});

  @override
  FoodOrderState createState() => FoodOrderState();
}

class FoodOrderState extends State<FoodOrder> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);

    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_orders),
      body: const DevScreen(false)
    );
  }
}

