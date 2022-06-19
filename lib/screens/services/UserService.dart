import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flututo/models/UserModel.dart';

class UserService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().asyncMap((user) => UserModel(
          uid: user!.uid,
          nomUser: '',
          preUser: '',
          telUser: user.phoneNumber!,
        ));
  }

  // Future<UserModel> auth(UserModel userModel) async {
  //   print(userModel.toJson());

  //   UserCredential userCredential;

  //   try {
  //     userCredential = await _auth.signInWithEmailAndPassword(
  //       email: userModel.email,
  //       password: userModel.password,
  //     );
  //   } catch (e) {
  //     userCredential = await _auth.createUserWithEmailAndPassword(
  //       email: userModel.email,
  //       password: userModel.password,
  //     );
  //   }

  //   userModel.setUid = userCredential.user!.uid;
  //   return userModel;
  // }
  Future<UserModel> save(UserModel userModel) async {
    userModel.setUid = _auth.currentUser!.uid;
    await _firestore.collection('utilisateur').doc(_auth.currentUser!.uid).set({
      'uid': userModel.uid,
      'nomUser': userModel.nomUser,
      'preUser': userModel.preUser,
      'telUser': userModel.telUser,
      'mailUser': userModel.mailUser,
      'imagePath': userModel.imagePath,
    }, SetOptions(merge: true));

    return userModel;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
