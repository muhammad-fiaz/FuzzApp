import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuzz/screen/DevScreen.dart';
import 'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzDataGenerator.dart';
import 'package:fuzz/utils/FuzzImages.dart';
import 'package:fuzz/utils/FuzzModel.dart';
import 'package:fuzz/utils/FuzzString.dart';
import 'package:fuzz/utils/FuzzWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FuzzBookCart.dart';

class FoodDescription extends StatefulWidget {
  static String tag = '/FoodDescription';

  const FoodDescription({super.key});

  @override
  FoodDescriptionState createState() => FoodDescriptionState();
}

class FoodDescriptionState extends State<FoodDescription> {
  late List<FoodDish> mList1;
  late List<FoodDish> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = addFoodDishData();
    mList2 = orderData();
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    var width = MediaQuery.of(context).size.width;

    Widget mHeading(var value) {
      return Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text(
            value.toString().toUpperCase(),
            style: primaryTextStyle(),
          ));
    }

    Widget mVegOption(var value, var iconColor) {
      return Row(
        children: <Widget>[
          Image.asset(food_c_type, color: iconColor, width: 18, height: 18),
          const SizedBox(width: 8),
          Text(value, style: primaryTextStyle()),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: food_app_background,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: expandHeight,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                titleSpacing: 0,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: innerBoxIsScrolled ? blackColor : white),
                    onPressed: () {
                      finish(context);
                    }),
                backgroundColor: innerBoxIsScrolled ? food_white : food_colorPrimary,
                actionsIconTheme: const IconThemeData(opacity: 0.0),
                title: SizedBox(
                  height: 60,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Row(
                          children: <Widget>[],
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: innerBoxIsScrolled ? blackColor : white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: SizedBox(
                    height: expandHeight,
                    child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: food_ic_popular3,
                      height: expandHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(food_lbl_burger, style: primaryTextStyle(size: 18)),
                          totalRatting(food_lbl_order_rating),
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: gradientBoxDecoration(gradientColor1: food_color_blue_gradient1, gradientColor2: food_color_blue_gradient2),
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                margin: const EdgeInsets.only(right: 10),
                                child: Text(food_lbl_offer, style: primaryTextStyle(size: 14, color: white)),
                              ),
                              Text(food_lbl_save_14_on_each_night, style: primaryTextStyle(color: food_textColorSecondary))
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Divider(height: 0.5, color: food_view_color),
                          const SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Expanded(flex: 1, child: mVegOption(food_lbl_veg_only, food_view_color)),
                              Expanded(flex: 2, child: mVegOption(food_lbl_non_veg_only, food_color_red)),
                            ],
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                        child: Row(
                          children: <Widget>[
                            SvgPicture.asset(food_ic_comass, color: food_colorPrimary, width: width * 0.08, height: width * 0.08),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(food_lbl_delivery_by_Fuzz_with_online_tracking, style: boldTextStyle()),
                                  Text(food_lbl_est_food_delivery_time, style: primaryTextStyle()),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_what_people_love_here),
                          const SizedBox(height: 16),
                          Container(
                            margin: const EdgeInsets.only(left: 16, right: 16),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, childAspectRatio: 0.72, mainAxisSpacing: 16),
                              itemCount: mList1.length,
                              padding: const EdgeInsets.only(bottom: 16),
                              itemBuilder: (context, index) {
                                return ItemGrid(mList1[index], index);
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          mHeading(food_lbl_what_people_love_here),
                          const SizedBox(height: 16),
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: mList2.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ItemList(mList2[index], index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  //height: width * 0.38,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => const CustomDialog(),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          decoration: gradientBoxDecoration(gradientColor1: food_color_blue_gradient1, gradientColor2: food_color_blue_gradient2, radius: 40),
                          child: Text(food_lbl_view_menu, style: primaryTextStyle(color: white)),
                        ),
                      ),
                      bottomBillDetail(context, food_color_green_gradient1, food_color_green_gradient2, food_lbl_order_now, onTap: () {
                        const FoodBookCart().launch(context);
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemList extends StatelessWidget {
  late FoodDish model;

  ItemList(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.image,
              width: width * 0.2,
              height: width * 0.2,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(child: Padding(padding: const EdgeInsets.only(right: 4), child: Image.asset(food_c_type, color: food_colorAccent, width: 16, height: 16))),
                      TextSpan(text: model.name, style: primaryTextStyle(size: 16, color: food_textColorPrimary)),
                    ],
                  ),
                ),
                Text(model.price, style: primaryTextStyle()),
              ],
            ),
          ),
          const Quantitybtn()
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemGrid extends StatelessWidget {
  late FoodDish model;

  ItemGrid(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            child: CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model.image,
              width: width,
              height: width * 0.3,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(model.name, style: primaryTextStyle(), maxLines: 1),
                Text(model.type, style: primaryTextStyle(color: food_textColorSecondary, size: 14)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(model.price, style: primaryTextStyle()),
                    const Quantitybtn(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const DevScreen(true);
  }
}

dialogContent(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Snakes", style: primaryTextStyle()),
                Text("10/-", style: primaryTextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Pizza & Pasta", style: primaryTextStyle()),
                Text("40/-", style: primaryTextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Burger/-", style: primaryTextStyle()),
                Text("20/-", style: primaryTextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Fast Food", style: primaryTextStyle()),
                Text("12/-", style: primaryTextStyle()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Italian", style: primaryTextStyle()),
                Text("60/-", style: primaryTextStyle()),
              ],
            )
          ],
        ),
      ));
}
