import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flututo/models/PropertiesModel.dart';
import 'package:flututo/models/UserModel.dart';

class PropertieService {
  PropertieModel propertieModel = PropertieModel(refPro: '');

  Future<void> deletePropertie(idPro) async {}

  Future<List> getAllProperties() async {
    var dbClient = '';
    var res = 'await dbClient.query("fruits")';

    return ['list'];
  }
}
