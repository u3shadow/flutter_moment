/// profile-image : "http://img2.findthebest.com/sites/default/files/688/media/images/Mingle_159902_i0.png"
/// avatar : "http://info.thoughtworks.com/rs/thoughtworks2/images/glyph_badge.png"
/// nick : "John Smith"
/// username : "jsmith"
class UserInfo {
  String _profileimage;
  String _avatar;
  String _nick;
  String _username;

  String get profileimage => _profileimage;
  String get avatar => _avatar;
  String get nick => _nick;
  String get username => _username;

  UserInfo({
    String profileimage,
    String avatar,
    String nick,
    String username}){
    _profileimage = profileimage;
    _avatar = avatar;
    _nick = nick;
    _username = username;
  }

  UserInfo.fromJson(dynamic json) {
    _profileimage = json["profile-image"];
    _avatar = json["avatar"];
    _nick = json["nick"];
    _username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["profile-image"] = _profileimage;
    map["avatar"] = _avatar;
    map["nick"] = _nick;
    map["username"] = _username;
    return map;
  }

}