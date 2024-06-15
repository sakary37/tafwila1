class Login {
  Login({
      this.id, 
      this.fname, 
      this.email,});

  Login.fromJson(dynamic json) {
    id = json['id'];
    fname = json['Fname'];
    email = json['email'];
  }
  num? id;
  String? fname;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Fname'] = fname;
    map['email'] = email;
    return map;
  }

}