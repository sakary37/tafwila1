class User {
  User({
      this.fname, 
      this.email,});

  User.fromJson(dynamic json) {
    fname = json['Fname'];
    email = json['email'];
  }
  String? fname;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fname'] = fname;
    map['email'] = email;
    return map;
  }

}