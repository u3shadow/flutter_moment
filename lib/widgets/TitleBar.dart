import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moment/utils/utils.dart';

class TitleBar extends StatefulWidget {
  @override
  _TitleBarState createState() => _TitleBarState();
}

class _TitleBarState extends State<TitleBar> {
  List<Widget> widgets = [];
  String backImg = "";
  String cameraImg = "";
  Color backColor = Colors.transparent;
  String titleText = "";

  @override
  void initState() {
    super.initState();
    setTrans(0);
  }

  void setTrans(int alpha) {
    setState(() {
      backImg = "moment_titlebar_icon_back_white";
      cameraImg = "moment_titlebar_icon_camera_white";
      backColor = Color.fromARGB(alpha, 250, 250, 250);
      titleText = "";
    });
  }

  void setNotTrans(int alpha) {
    setState(() {
      backImg = "moment_titlebar_icon_back_black";
      cameraImg = "moment_titlebar_icon_camera_black";
      backColor = Color.fromARGB(alpha, 250, 250, 250);
      titleText = "朋友圈";
    });
  }

  @override
  Widget build(BuildContext context) {
    widgets.clear();
    widgets.add(Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 20, top: 0, right: 0, bottom: 0),
            child: Image.asset(Utils.getImgPath(backImg),
                width: 40, height: 40))));
    widgets.add(Align(
        alignment: Alignment.center,
        child: Text(titleText, style: TextStyle(fontSize: 25))));
    widgets.add(Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 20, bottom: 0),
            child: Image.asset(Utils.getImgPath(cameraImg),
                width: 40, height: 40))));
    return Container(
        decoration: BoxDecoration(color: backColor),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 75, minHeight: 75),
            child: Stack(children: widgets)));
  }
}
