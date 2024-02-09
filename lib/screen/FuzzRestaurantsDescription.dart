import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fuzz/screen/DevScreen.dart';
import  'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzDataGenerator.dart';
import 'package:fuzz/utils/FuzzImages.dart';
import 'package:fuzz/utils/FuzzModel.dart';
import 'package:fuzz/utils/FuzzString.dart';
import 'package:fuzz/utils/FuzzWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FuzzBookDetail.dart';
import 'FuzzDescription.dart';
import 'FuzzGallery.dart';
import 'FuzzReview.dart';

class FoodRestaurantsDescription extends StatefulWidget {
  static String tag = '/FoodRestaurantsDescription';

  const FoodRestaurantsDescription({super.key});

  @override
  FoodRestaurantsDescriptionState createState() => FoodRestaurantsDescriptionState();
}

class FoodRestaurantsDescriptionState extends State<FoodRestaurantsDescription> {
  List<DataFilter> list = getAllData();
  late List<ReviewModel> mReviewList;
  late List<FoodDish> mList2;
  var mPeopleList, mCuisine;

  @override
  void initState() {
    super.initState();
    mReviewList = addReviewData();
    mList2 = orderData();
    mPeopleList = ["1", "2", "3", "4", "5"];
    mCuisine = [
      "Charcoal Chicken",
      "Chiness",
      "Fast Food",
      "Juice",
      "Gujarati",
      "Salad",
      "South Indian",
      "American",
      "BBQ",
      "Bakery",
      "Biryani",
      "Burger",
      "Cafe",

    ];

    changeStatusColor(Colors.transparent);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    var width = MediaQuery.of(context).size.width;
    var mTime = 0;

    Widget mOption(var icon, var value) {
      return Column(
        children: <Widget>[
          Icon(icon, color: food_colorPrimary, size: 20),
          Text(value, style: primaryTextStyle(size: 16)),
        ],
      );
    }

    Widget iconWithTitle(var icon, var value) {
      return RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(padding: const EdgeInsets.only(right: 16), child: Icon(icon, color: food_textColorSecondary, size: 18)),
            ),
            TextSpan(text: value, style: primaryTextStyle(size: 16, color: food_textColorPrimary)),
          ],
        ),
      );
    }

    Widget mGallery(var icon, var value) {
      return RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Padding(padding: const EdgeInsets.only(right: 8), child: Icon(icon, color: food_textColorPrimary, size: 18)),
            ),
            TextSpan(text: value, style: primaryTextStyle(size: 16, color: food_textColorPrimary)),
          ],
        ),
      );
    }

    Widget reviewOption(var heading, var rating) {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(heading, style: primaryTextStyle(color: food_textColorSecondary)),
            Container(height: 0.5, width: width * 0.45, color: food_view_color),
            Text(rating, style: primaryTextStyle(color: food_textColorSecondary)),
          ],
        ),
      );
    }



    return Scaffold(
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
              backgroundColor: innerBoxIsScrolled ? food_white : food_white,
              actionsIconTheme: const IconThemeData(opacity: 0.0),
              title: SizedBox(
                height: 60,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.favorite_border, color: food_textColorPrimary),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, color: food_textColorPrimary),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: SizedBox(
                  height: expandHeight,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        imageUrl: food_ic_popular4,
                        width: width,
                        fit: BoxFit.cover,
                      ),
                      GestureDetector(
                        onTap: () {
                          const FoodGallery().launch(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 16, bottom: 16),
                          height: width * 0.11,
                          width: width * 0.3,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: white),
                          child: mGallery(Icons.image, food_lbl_photo),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food_lbl_italian, style: primaryTextStyle(color: food_color_red)),
                    Text(food_lbl_gravity_spacebar, style: primaryTextStyle(size: 20)),
                    Row(
                      children: <Widget>[
                        Text(food_lbl_gurugram_sector_19, style: primaryTextStyle(color: food_textColorSecondary)),
                        Container(
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: food_textColorSecondary),
                          width: 4,
                          margin: const EdgeInsets.only(right: 16, left: 4),
                          height: 4,
                        ),
                        Text(food_lbl_3_4_km_away, style: primaryTextStyle(color: food_textColorSecondary)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    totalRatting(food_lbl__96_rating),
                    const Divider(height: 0.5, color: food_view_color),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        mOption(Icons.call, food_lbl_call),
                        mOption(Icons.star_border, food_lbl_reviews),
                        mOption(Icons.add_box, food_lbl_add_photo),
                        mOption(Icons.directions, food_lbl_direction),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              const FoodDescription().launch(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(color: food_colorPrimary, borderRadius: BorderRadius.circular(50)),
                              child: Text(food_lbl_order_online, style: primaryTextStyle(color: white)).center(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              const FoodBookDetail().launch(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(border: Border.all(color: food_textColorPrimary), borderRadius: BorderRadius.circular(50)),
                              child: Text(food_lbl_book_table, style: primaryTextStyle()).center(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food_lbl_plan_your_visit.toUpperCase(), style: primaryTextStyle()),
                    const SizedBox(height: 8),
                    iconWithTitle(Icons.hourglass_empty, food_lbl_peak_wait_up_to_30_min_from_4_00_to_10_00_pm).paddingOnly(top: 4, bottom: 4),
                    const Divider(height: 0.5, color: food_view_color),
                    iconWithTitle(Icons.schedule, food_lbl_people_typically_spend_1_2_hours).paddingOnly(top: 4, bottom: 4),
                    const Divider(height: 0.5, color: food_view_color),
                    iconWithTitle(Icons.schedule, food_lbl_you_visited_5_month_ago).paddingOnly(top: 4, bottom: 4),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(food_lbl_user_review.toUpperCase(), style: primaryTextStyle()),
                    const SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Text(food_lbl__5_0, style: primaryTextStyle()),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            totalRatting(food_lbl_very_good),
                            Text(food_lbl__1_700_reviews_on_google, style: primaryTextStyle(color: food_textColorSecondary)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    reviewOption(food_lbl_cleanliness, food_lbl__5_0),
                    reviewOption(food_lbl_comfort, food_lbl__5_0),
                    reviewOption(food_lbl_location, food_lbl__5_0),
                    reviewOption(food_lbl_Facilities, food_lbl__5_0),
                    reviewOption(food_lbl_staff, food_lbl__5_0),
                    reviewOption(food_lbl_Value, food_lbl__5_0),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        const DevScreen(true).launch(context);
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: food_colorPrimary, borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(12),
                        child: Text(food_lbl_write_a_review, style: primaryTextStyle(color: white)).center(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(food_lbl_what_guest_are_saying.toUpperCase(), style: primaryTextStyle()),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mReviewList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Review(mReviewList[index], index);
                      },
                    ),
                    mViewAll(context, food_lbl_View_All_User_reviews, onTap: () {
                      const FoodReview().launch(context);
                    }),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 16),
                    Text(food_lbl_additional_detail.toUpperCase(), style: primaryTextStyle()),
                    const SizedBox(height: 16),
                    iconWithTitle(Icons.call, food_user_contact).paddingOnly(top: 4, bottom: 4),
                    const Divider(height: 0.5, color: food_view_color),
                    iconWithTitle(Icons.location_on, food_lbl_peak_wait_up_to_30_min_from_4_00_to_10_00_pm).paddingOnly(top: 4, bottom: 4),
                    const Divider(height: 0.5, color: food_view_color),
                    iconWithTitle(Icons.schedule, food_lbl_open_hours).paddingOnly(top: 4, bottom: 4),
                    const Divider(height: 0.5, color: food_view_color),
                    iconWithTitle(Icons.person_outline, food_lbl__100_for_two_people_approx).paddingOnly(top: 4, bottom: 4),
                    const SizedBox(height: 16),
                    Container(
                      decoration: const BoxDecoration(color: food_color_light_orange),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(Icons.shopping_basket, color: food_color_Orange, size: 18),
                                  ),
                                ),
                                TextSpan(text: food_lbl_15_off, style: primaryTextStyle(size: 16, color: food_color_Orange)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(food_lbl_on_total_bill_till_may_2020, style: primaryTextStyle())
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    heading(food_lbl_what_people_love_here),
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
      ),
    );
  }
}

// ignore: must_be_immutable
class Review extends StatelessWidget {
  late ReviewModel model;

  Review(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: CircleAvatar(radius: 20, backgroundImage: CachedNetworkImageProvider(model.image)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.review),
              Row(
                children: <Widget>[
                  mRating(model.rate),
                  Text(model.duration, style: primaryTextStyle(color: food_textColorSecondary, size: 16)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
