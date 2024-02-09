import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fuzz/utils/AppWidget.dart';
import 'package:fuzz/utils/FuzzColors.dart';
import 'package:fuzz/utils/FuzzDataGenerator.dart';
import 'package:fuzz/utils/FuzzModel.dart';
import 'package:fuzz/utils/FuzzString.dart';
import 'package:nb_utils/nb_utils.dart';

class FoodGallery extends StatefulWidget {
  static String tag = '/FoodGallery';

  const FoodGallery({super.key});

  @override
  FoodGalleryState createState() => FoodGalleryState();
}

class FoodGalleryState extends State<FoodGallery> {
  late List<images> mAmbienceList;
  late List<images> mFoodList;
  List<images>? mViewImagesList;
  late List<images> mUserPhotosList;

  @override
  void initState() {
    super.initState();
    mAmbienceList = addAmbiencePhotosData();
    mFoodList = addFoodPhotosData();
    mViewImagesList = addViewImagesData();
    mUserPhotosList = addUserPhotosData();
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(food_app_background);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  child: Container(
                      color: food_app_background,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: food_icon_color,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TabBar(
                            labelPadding: const EdgeInsets.only(left: 16, right: 0),
                            indicatorWeight: 3.3,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: food_colorAccent,
                            labelColor: food_textColorPrimary,
                            isScrollable: true,
                            unselectedLabelColor: food_textColorSecondary,
                            tabs: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  food_lbl_all_photo,
                                  style: boldTextStyle(size: 16),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  food_lbl_ambience,
                                  style: boldTextStyle(size: 16),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  food_lbl_food,
                                  style: boldTextStyle(size: 16),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  food_lbl_user_photos,
                                  style: boldTextStyle(size: 16),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    color: food_app_background,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      Text(food_lbl_ambience, style: primaryTextStyle()),
                      const SizedBox(
                        height: 8,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemCount: mAmbienceList.length,
                        itemBuilder: (context, index) {
                          return Media(mAmbienceList[index], index);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(food_lbl_food, style: primaryTextStyle()),
                      const SizedBox(
                        height: 8,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemCount: mFoodList.length,
                        itemBuilder: (context, index) {
                          return Media(mFoodList[index], index);
                        },
                      ),
                      const SizedBox(height: 24),
                      Text(food_lbl_user_photos, style: primaryTextStyle()),
                      const SizedBox(height: 8),
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemCount: mUserPhotosList.length,
                        itemBuilder: (context, index) {
                          return Media(mUserPhotosList[index], index);
                        },
                      ),
                      const SizedBox(height: 24),
                    ]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemCount: mAmbienceList.length,
                    itemBuilder: (context, index) {
                      return Media(mAmbienceList[index], index);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemCount: mFoodList.length,
                    itemBuilder: (context, index) {
                      return Media(mFoodList[index], index);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                    itemCount: mUserPhotosList.length,
                    itemBuilder: (context, index) {
                      return Media(mUserPhotosList[index], index);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Media extends StatelessWidget {
  late images model;

  Media(this.model, int pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: model.image,
        fit: BoxFit.fill,
        height: width * 0.15,
        width: width * 0.25,
      ),
    );
  }
}
