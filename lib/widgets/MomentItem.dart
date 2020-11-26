import 'package:flutter/cupertino.dart';
import 'package:flutter_moment/data/moment.dart';
import 'package:flutter_moment/utils/utils.dart';

class MomentItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MomentState();
  }
}

class MomentState extends State<MomentItem> {
  Moment moment;

  @override
  void initState() {
    super.initState();
    widgets = getRow();
    widgets1 = getComment();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(Utils.getImgPath("moment_list_icon_avatar_placeholder"),
                width: 100, height: 100),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("testname",
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 0, 255, 255))),
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                                "test content EdgeInsets.only EdgeInsets.only EdgeInsets.only EdgeInsets.only EdgeInsets.only EdgeInsets.only",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color.fromARGB(255, 0, 0, 0)))),
                        Wrap(
                            spacing: 7,
                            runSpacing: 7,
                            alignment: WrapAlignment.start,
                            children: widgets),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                                color: Color.fromARGB(255, 200, 200, 200),
                                child: Column(children: widgets1)))
                      ],
                    )))
          ],
        ));
  }

  List<Widget> widgets = [];
  List<Widget> widgets1 = [];

  List<Widget> getRow() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(Image.asset(
          Utils.getImgPath("moment_list_icon_avatar_placeholder"),
          width: 120,
          height: 120));
    }
    return list;
  }

  List<Widget> getComment() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(Padding(
        padding: EdgeInsets.only(top: 10,bottom: 10),
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Text("testname:",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 0, 255, 255))),
        Expanded(child:Text(
            "这是测试消息，把拉粑粑了，换行换行，快换行",
            style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))))
      ])));
    }
    return list;
  }
}
