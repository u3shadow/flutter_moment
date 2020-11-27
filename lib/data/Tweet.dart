/// content : "沙发！"
/// images : [{"url":"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRDy7HZaHxn15wWj6pXE4uMKAqHTC_uBgBlIzeeQSj2QaGgUzUmHg"},{"url":"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTlJRALAf-76JPOLohBKzBg8Ab4Q5pWeQhF5igSfBflE_UYbqu7"},{"url":"http://i.ytimg.com/vi/rGWI7mjmnNk/hqdefault.jpg"}]
/// sender : {"username":"jport","nick":"Joe Portman","avatar":"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRJm8UXZ0mYtjv1a48RKkFkdyd4kOWLJB0o_l7GuTS8-q8VF64w"}
/// comments : [{"content":"Good.","sender":{"username":"outman","nick":"Super hero","avatar":"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRJm8UXZ0mYtjv1a48RKkFkdyd4kOWLJB0o_l7GuTS8-q8VF64w"}},{"content":"Like it too","sender":{"username":"inman","nick":"Doggy Over","avatar":"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRJm8UXZ0mYtjv1a48RKkFkdyd4kOWLJB0o_l7GuTS8-q8VF64w"}}]

class Tweet {
  String _content;
  List<Images> _images;
  Sender _sender;
  List<Comments> _comments;

  String get content => _content;
  List<Images> get images => _images;
  Sender get sender => _sender;
  List<Comments> get comments => _comments;

  Tweet({
      String content, 
      List<Images> images, 
      Sender sender, 
      List<Comments> comments}){
    _content = content;
    _images = images;
    _sender = sender;
    _comments = comments;
}

  Tweet.fromJson(dynamic json) {
    _content = json["content"];
    if (json["images"] != null) {
      _images = [];
      json["images"].forEach((v) {
        _images.add(Images.fromJson(v));
      });
    }
    _sender = json["sender"] != null ? Sender.fromJson(json["sender"]) : null;
    if (json["comments"] != null) {
      _comments = [];
      json["comments"].forEach((v) {
        _comments.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["content"] = _content;
    if (_images != null) {
      map["images"] = _images.map((v) => v.toJson()).toList();
    }
    if (_sender != null) {
      map["sender"] = _sender.toJson();
    }
    if (_comments != null) {
      map["comments"] = _comments.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// content : "Good."
/// sender : {"username":"outman","nick":"Super hero","avatar":"https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRJm8UXZ0mYtjv1a48RKkFkdyd4kOWLJB0o_l7GuTS8-q8VF64w"}

class Comments {
  String _content;
  Sender _sender;

  String get content => _content;
  Sender get sender => _sender;

  Comments({
      String content, 
      Sender sender}){
    _content = content;
    _sender = sender;
}

  Comments.fromJson(dynamic json) {
    _content = json["content"];
    _sender = json["sender"] != null ? Sender.fromJson(json["sender"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["content"] = _content;
    if (_sender != null) {
      map["sender"] = _sender.toJson();
    }
    return map;
  }

}

/// username : "outman"
/// nick : "Super hero"
/// avatar : "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRJm8UXZ0mYtjv1a48RKkFkdyd4kOWLJB0o_l7GuTS8-q8VF64w"

class Sender {
  String _username;
  String _nick;
  String _avatar;

  String get username => _username;
  String get nick => _nick;
  String get avatar => _avatar;

  Sender({
      String username, 
      String nick, 
      String avatar}){
    _username = username;
    _nick = nick;
    _avatar = avatar;
}

  Sender.fromJson(dynamic json) {
    _username = json["username"];
    _nick = json["nick"];
    _avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = _username;
    map["nick"] = _nick;
    map["avatar"] = _avatar;
    return map;
  }

}

/// url : "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRDy7HZaHxn15wWj6pXE4uMKAqHTC_uBgBlIzeeQSj2QaGgUzUmHg"

class Images {
  String _url;

  String get url => _url;

  Images({
      String url}){
    _url = url;
}

  Images.fromJson(dynamic json) {
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["url"] = _url;
    return map;
  }

}