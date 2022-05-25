class UserModel {
  String uid = '';
  String email;
  String password;

  UserModel(this.uid, this.email, this.password);

  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'password': password,
      };
}
