class UserModel {
  String uid = '';
  String? preUser;
  String? nomUser;
  String telUser;
  String? mailUser;
  String? imagePath;

  UserModel({
    this.uid = '',
    this.nomUser,
    this.preUser,
    required this.telUser,
    this.mailUser,
    this.imagePath,
  });

  set setUid(value) => uid = value;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'nom': nomUser,
        'prenom': preUser,
        'numero': telUser,
        'email': mailUser,
      };

  Future<void> deleteUser(uid) async {}
}
