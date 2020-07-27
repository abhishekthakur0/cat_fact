class CatFactModel {
  List<All> all;

  CatFactModel({this.all});

  CatFactModel.fromJson(Map<String, dynamic> json) {
    if (json['all'] != null) {
      all = new List<All>();
      json['all'].forEach((v) {
        all.add(new All.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.all != null) {
      data['all'] = this.all.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class All {
  String sId;
  String text;
  String type;
  User user;
  int upvotes;
  Null userUpvoted;

  All(
      {this.sId,
      this.text,
      this.type,
      this.user,
      this.upvotes,
      this.userUpvoted});

  All.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    text = json['text'];
    type = json['type'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    upvotes = json['upvotes'];
    userUpvoted = json['userUpvoted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['text'] = this.text;
    data['type'] = this.type;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['upvotes'] = this.upvotes;
    data['userUpvoted'] = this.userUpvoted;
    return data;
  }
}

class User {
  String sId;
  Name name;

  User({this.sId, this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    return data;
  }
}

class Name {
  String first;
  String last;

  Name({this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}
