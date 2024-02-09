import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzDataGenerator.dart';
import 'package:fuzz/utils/FuzzModel.dart';
import 'package:fuzz/utils/FuzzString.dart';
import 'package:fuzz/utils/FuzzWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FuzzDashboard.dart';

class FoodCreateAccount extends StatefulWidget {
  static String tag = '/FoodCreateAccount';

  const FoodCreateAccount({super.key});

  @override
  FoodCreateAccountState createState() => FoodCreateAccountState();
}

class FoodCreateAccountState extends State<FoodCreateAccount> {
  late List<images> mList;

  @override
  void initState() {
    super.initState();
    mList = addUserPhotosData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: food_white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: width,
              alignment: Alignment.topLeft,
              color: food_white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  finish(context);
                },
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food_lbl_create_your_account_and_nget_99_money, style: boldTextStyle(size: 24), maxLines: 2),
                Text(food_lbl_its_s_super_quick, style: primaryTextStyle()),
              ],
            ).paddingOnly(left: 16, right: 16),
            const SizedBox(height: 30.0),
            SizedBox(
              height: width * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(mList[index].image), radius: 45),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(50), border: Border.all(color: food_colorPrimary)),
              child: Row(
                children: <Widget>[
                  const Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(contentPadding: EdgeInsets.all(16.0), isDense: true, hintText: food_hint_mobile_no, border: InputBorder.none),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        const FoodDashboard().launch(context,isNewTask: true);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: gradientBoxDecoration(radius: 50, gradientColor1: food_color_blue_gradient1, gradientColor2: food_color_blue_gradient2),
                        child: const Icon(Icons.arrow_forward, color: food_white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
