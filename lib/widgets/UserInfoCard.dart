import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moment/data/UserInfo.dart';
import 'package:flutter_moment/utils/utils.dart';
import 'package:http/http.dart' as http;

class UserInfoCard extends StatefulWidget {
  UserInfoCard({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfoCard> {
  List<Widget> widgets = [];
  UserInfo _user = UserInfo();
  Future getUserData() async {
    var client = http.Client();
    var uri =
    Uri.parse("http://thoughtworks-ios.herokuapp.com/user/jsmith");
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      var responseJson = json.decode(response.body);
      setState(() {
        setState(() {
          _user =UserInfo.fromJson(responseJson);
        });
      });
    } else {
      print('请求失败 code 码为${response.statusCode}');
    }
  }
  @override
  void initState() {
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    widgets.clear();
    widgets.add(Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 20),
            child: FadeInImage.assetNetwork(
                placeholder: Utils.getImgPath('moment_list_icon_header_info_placeholder'),
                image: _user.profileimage,
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
                    child: Text(_user.nick,
                        style: TextStyle(fontSize: 18, color: Colors.white))),
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage.assetNetwork(
                      placeholder: Utils.getImgPath('moment_list_icon_avatar_placeholder'),
                      image: _user.profileimage,
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
