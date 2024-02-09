import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void changeStatusColor(Color color) async {
  setStatusBarColor(color);
}


Widget appBarTitleWidget(context, String title, {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: color ,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(color: Colors.black , size: 20),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}

AppBar appBar(BuildContext context, String title, {List<Widget>? actions, bool showBack = true, Color? color, Color? iconColor, Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    leading: showBack
        ? IconButton(
            onPressed: () {
              finish(context);
            },
            icon: const Icon(Icons.arrow_back, color:  black),
          )
        : null,
    title: appBarTitleWidget(context, title, textColor: Colors.black, color: color),
    actions: actions,
  );
}


Widget? Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/food/placeholder.jpg', fit: BoxFit.cover);



