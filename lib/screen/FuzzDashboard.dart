import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzDataGenerator.dart';
import 'package:fuzz/utils/FuzzImages.dart';
import 'package:fuzz/utils/FuzzModel.dart';
import 'package:fuzz/utils/FuzzString.dart';
import 'package:fuzz/utils/FuzzWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FuzzAddAddress.dart';
import 'FuzzBookCart.dart';
import 'FuzzDescription.dart';
import 'FuzzFavourite.dart';
import 'FuzzOrder.dart';
import 'FuzzProfile.dart';
import 'FuzzSignIn.dart';
import 'FuzzViewRestaurants.dart';

class FoodDashboard extends StatefulWidget {
  static String tag = '/FoodDashboard';

  const FoodDashboard({super.key});

  @override
  FoodDashboardState createState() => FoodDashboardState();
}

class FoodDashboardState extends State<FoodDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  late List<DashboardCollections> mCollectionList;
  late List<Restaurants> mBakeryList;
  late List<Restaurants> mDeliveryList;
  late List<Restaurants> mDineOutList;
  late List<DashboardCollections> mExperienceList;
  late List<Restaurants> mCafeList;

  @override
  void initState() {
    super.initState();
    mCollectionList = addCollectionData();
    mBakeryList = addBakeryData();
    mDeliveryList = addDeliveryRestaurantsData();
    mDineOutList = addDineOutRestaurantsData();
    mExperienceList = addCuisineData();
    mCafeList = addCafeData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(white);
    Widget topGradient(var gradientColor1, var gradientColor2, var icon, var heading, var subHeading) {
      var width = MediaQuery.of(context).size.width;
      return GestureDetector(
        onTap: () {
          const FoodViewRestaurants().launch(context);
        },
        child: Container(
          decoration: gradientBoxDecoration(showShadow: true, gradientColor1: gradientColor1, gradientColor2: gradientColor2),
          padding: const EdgeInsets.all(10),
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(icon, color: food_white, width: width * 0.06, height: width * 0.06),
              Text(heading, style: primaryTextStyle(color: food_white)),
              Text(
                subHeading,
                style: primaryTextStyle(color: food_white, size: 12),
              ),
            ],
          )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: food_app_background,
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: food_white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  Text(food_app_name, style: boldTextStyle(size: 18)),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      const FoodBookCart().launch(context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          mAddress(context),
                          const SizedBox(height: 16),
                          search(context),
                          const SizedBox(height: 16),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: topGradient(
                                  food_color_blue_gradient1,
                                  food_color_blue_gradient2,
                                  food_cloche,
                                  food_lbl_food_order,
                                  food_lbl_find_near_by_restaurants,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: topGradient(
                                  food_color_orange_gradient1,
                                  food_color_orange_gradient2,
                                  food_ic_table,
                                  food_lbl_book_a_table,
                                  food_lbl_may_take_upto_3_mins,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          heading(food_lbl_get_inspired_by_collections),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mCollectionList.length,
                              padding: const EdgeInsets.only(right: 16),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Collection(mCollectionList[index], index);
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
                          heading(food_lbl_cake_ice_cream_and_bakery),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mBakeryList.length,
                              padding: const EdgeInsets.only(bottom: 4, right: 16),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mBakeryList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants, onTap: () {
                            const FoodViewRestaurants().launch(context);
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          heading(food_lbl_delivery_restaurants),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(bottom: 4, right: 16),
                              itemCount: mDeliveryList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mDeliveryList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants, onTap: () {
                            const FoodViewRestaurants().launch(context);
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          heading(food_lbl_dine_out_restaurants),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: mDineOutList.length,
                              padding: const EdgeInsets.only(bottom: 4, right: 16),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mDineOutList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants, onTap: () {
                            const FoodViewRestaurants().launch(context);
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          heading(food_lbl_experience_your_favourite_cuisine),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(right: 16),
                              itemCount: mExperienceList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Collection(mExperienceList[index], index);
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
                          heading(food_lbl_cafe),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(bottom: 4, right: 16),
                              itemCount: mCafeList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Item(mCafeList[index], index);
                              },
                            ),
                          ),
                          mViewAll(context, food_lbl_view_all_restaurants, onTap: () {
                            const FoodViewRestaurants().launch(context);
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const FoodSideMenu(),
    );
  }
}

// ignore: must_be_immutable
class Item extends StatelessWidget {
  late Restaurants model;

  Item(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        const FoodDescription().launch(context);
      },
      child: Container(
        width: width * 0.4,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                    imageUrl: model.image,
                    height: width * 0.3,
                    width: width * 0.4,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.favorite_border, color: food_white, size: 18),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.name, style: primaryTextStyle(), maxLines: 2),
                  4.height,
                  Row(
                    children: <Widget>[
                      mRating(model.rating.toString()),
                      Text(
                        model.review,
                        style: primaryTextStyle(color: food_textColorSecondary, size: 14),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Collection extends StatelessWidget {
  late DashboardCollections model;

  Collection(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        const FoodViewRestaurants().launch(context);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: model.image,
                width: width * 0.5,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model.name, style: primaryTextStyle(size: 20, fontFamily: 'Andina', color: white)),
                  const SizedBox(height: 4),
                  Text(model.info, style: primaryTextStyle(size: 14, color: food_white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodSideMenu extends StatefulWidget {
  const FoodSideMenu({super.key});

  @override
  FoodSideMenuState createState() => FoodSideMenuState();
}

class FoodSideMenuState extends State<FoodSideMenu> {
  Widget mOption(var gradientColor1, var gradientColor2, var icon, var value, var tags) {
    return GestureDetector(
      onTap: () {
        finish(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => tags));
//         launchScreen(context, tags);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [gradientColor1, gradientColor2]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(icon, size: 18, color: food_white),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              value,
              style: primaryTextStyle(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: SizedBox(
        width: width * 0.85,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          elevation: 8,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  width: width,
                  decoration: gradientBoxDecoration(gradientColor1: food_colorPrimary, gradientColor2: food_colorPrimary, radius: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CircleAvatar(backgroundImage: CachedNetworkImageProvider(food_ic_user1), radius: 40),
                      Text(food_username, style: primaryTextStyle(color: food_white)),
                      Text(food_user_email, style: primaryTextStyle(color: white))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
                  child: Column(
                    children: <Widget>[
                      mOption(food_color_blue_gradient1, food_color_blue_gradient2, Icons.favorite_border, food_lbl_favourite, const FoodFavourite()),
                      mOption(food_color_orange_gradient1, food_color_orange_gradient2, Icons.add, food_lbl_add_address, const FoodAddAddress()),
                      mOption(food_color_yellow_gradient1, food_color_yellow_gradient2, Icons.insert_drive_file, food_lbl_orders, const FoodOrder()),
                      mOption(food_color_blue_gradient1, food_color_blue_gradient2, Icons.person_outline, food_lbl_profile, const FoodProfile()),
                      mOption(food_color_orange_gradient1, food_color_orange_gradient2, Icons.settings_power, food_lbl_logout, const FoodSignIn()),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
