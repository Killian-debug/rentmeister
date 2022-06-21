import 'package:flutter/material.dart';
import 'package:flututo/models/UserModel.dart';

// list of all tenants with delete method

class Tenants extends StatefulWidget {
  Tenants({Key? key}) : super(key: key);

  @override
  State<Tenants> createState() => _TenantsState();
}

class _TenantsState extends State<Tenants> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tenants page ( block of Tenants and infos"),
    );
  }
}

Map<int, UserModel> _propData = {
  0: UserModel(
      idPro: 'aefaefe1236',
      refPro: 'ref02',
      descPro: 'descPro',
      statut: 'libre',
      adresse: 'adresse',
      proprietaire: '1'),
  1: UserModel(
      idPro: 'iqrh468431qh',
      refPro: 'ref98',
      descPro: 'descPro',
      statut: 'libre',
      adresse: 'adresse',
      proprietaire: '1'),
  2: UserModel(
      idPro: 'oisj684684',
      refPro: 'opl12',
      descPro: 'descPro',
      statut: 'occupé',
      adresse: 'adresse',
      proprietaire: '1'),
  3: UserModel(uid: '', telUser: ''),
};

class Server {
  static List<UserModel> getPropList() => _propData.values.toList();

  static UserModel getPropByID(int id) {
    assert(id >= 0 && id <= 6);
    return _propData[id]!;
  }
}
