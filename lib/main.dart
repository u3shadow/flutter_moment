import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moment/widgets/MomentItem.dart';
import 'package:flutter_moment/widgets/TitleBar.dart';
import 'package:flutter_moment/widgets/UserInfoCard.dart';
import 'package:http/http.dart' as http;

import 'data/Tweet.dart';

void main() {
  runApp(MyApp());
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List<Widget> widgets = [];
  List<Tweet> _dataList = List<Tweet>();

  @override
  void initState() {
    super.initState();
    getListData();
  }

  Future getListData() async {
    var client = http.Client();
    var uri =
        Uri.parse("http://thoughtworks-ios.herokuapp.com/user/jsmith/tweets");
    http.Response response = await client.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      List responseJson = json.decode(response.body);
      setState(() {
        _dataList =responseJson.map((m) => new Tweet.fromJson(m)).where(
                (element) => element.content != null || element.images != null).toList();
      });
    } else {
      print('请求失败 code 码为${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = new ScrollController();
    controller.addListener(() {
      int offset = controller.offset.toInt();
      print("滑动距离$offset");
      if (offset <= 200) {
        childKey.currentState.setTrans(100);
      } else if (offset > 200 && offset <= 230) {
        var alpha = 100 - (offset - 200) * 100 / 30;
        childKey.currentState.setTrans(alpha.toInt());
      } else if (offset > 230 && offset <= 260) {
        var alpha = (offset - 230) * 100 / 30;
        childKey.currentState.setNotTrans(alpha.toInt());
      }
    });
    return Scaffold(
        body: Stack(children: <Widget>[
      Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
            itemCount: _dataList.length,
            controller: controller,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }),
      ),
      Align(alignment: Alignment.topCenter, child: TitleBar(key: childKey))
    ]));
  }

  Widget getRow(int i) {
    if (i == 0) {
      return UserInfoCard();
    } else if (i > 0 && i <= _dataList.length) {
      return MomentItem(_dataList[i - 1]);
    } else
      return null;
  }
}
