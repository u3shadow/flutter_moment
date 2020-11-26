import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moment/widgets/MomentItem.dart';
import 'package:flutter_moment/widgets/TitleBar.dart';
import 'package:flutter_moment/widgets/UserInfoCard.dart';

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

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScrollController controller = new ScrollController();
    controller.addListener(() {
      int offset = controller.offset.toInt();
      print("滑动距离$offset");
      if(offset <= 200){
        childKey.currentState.setTrans(100);
      }else if(offset > 200&&offset <= 230){
        var alpha = 100 - (offset - 200)*100/30;
        childKey.currentState.setTrans(alpha.toInt());
      }else if(offset > 230&&offset <= 260){
        var alpha =(offset - 230)*100/30;
        childKey.currentState.setNotTrans(alpha.toInt());
      }
    });
    return Scaffold(
        body: Stack(children: <Widget>[
      Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
            itemCount: 15,
            controller: controller,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }),
      ),
      Align(alignment: Alignment.topCenter, child: TitleBar(key:childKey))
    ]));
  }

  Widget getRow(int i) {
    if (i == 0) {
      return UserInfoCard();
    } else {
      return MomentItem();
    }
  }
}
