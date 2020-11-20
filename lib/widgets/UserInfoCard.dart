import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moment/data/Models.dart';
import 'package:flutter_moment/utils/utils.dart';

class UserInfoCard extends StatelessWidget {
  UserInfoCard({this.userInfoModel, Key key}) : super(key: key);
  final UserInfoModel userInfoModel;
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    widgets.clear();
    widgets.add(Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 20),
            child: Image.asset(
                Utils.getImgPath("moment_list_icon_header_info_placeholder"),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity))));
    widgets.add(Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 10, bottom: 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding:
                        EdgeInsets.only(left: 0, top: 0, right: 10, bottom: 0),
                    child: Text("Test name",
                        style: TextStyle(fontSize: 18, color: Colors.white))),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                        Utils.getImgPath("moment_list_icon_avatar_placeholder"),
                        width: 80,
                        height: 80))
              ],
            ))));
    return Container(
        child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 300, minHeight: 300),
            child: Stack(children: widgets)));
  }
}
