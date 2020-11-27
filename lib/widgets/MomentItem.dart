import 'package:flutter/cupertino.dart';
import 'package:flutter_moment/data/Tweet.dart';
import 'package:flutter_moment/utils/utils.dart';

class MomentItem extends StatefulWidget {
  Tweet tweet;
  MomentItem(this.tweet,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MomentState(tweet);
  }
}

class MomentState extends State<MomentItem> {
  Tweet moment;

  MomentState(Tweet tweet) {
    this.moment = tweet;
  }

  @override
  void initState() {
    super.initState();
    widgets = getRow();
    if(moment.comments != null&&moment.comments.length > 0)
    widgets1 = getComment();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.assetNetwork(
                placeholder: Utils.getImgPath('moment_list_icon_avatar_placeholder'),
                image: moment.sender.avatar,
                width: 100, height: 100),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(moment.sender.nick,
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 0, 255, 255))),
                        Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                                moment.content == null?"":moment.content,
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
    for (int i = 0; i < moment.images.length; i++) {
      list.add(FadeInImage.assetNetwork(
          placeholder: Utils.getImgPath('moment_list_icon_avatar_placeholder'),
          image: moment.images[i].url,
          width: 120,
          height: 120));
    }
    return list;
  }

  List<Widget> getComment() {
    List<Widget> list = [];
    for (int i = 0; i < moment.comments.length; i++) {
      list.add(Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(moment.comments[i].sender.nick,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 255, 255))),
                Expanded(
                    child: Text(moment.comments[i].content,
                        style: TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))))
              ])));
    }
    return list;
  }
}
