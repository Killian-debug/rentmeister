import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flututo/models/TenancyModel.dart';
import 'package:flututo/models/UserModel.dart';
import 'package:flututo/screens/services/UserService.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/services.dart';

class addTenantPage extends StatefulWidget {
  addTenantPage({Key? key}) : super(key: key);

  @override
  State<addTenantPage> createState() => _addTenantPagetate();
}

class _addTenantPagetate extends State<addTenantPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _numController = TextEditingController();
  UserService _userService = UserService();

  String _number = '';
  //final RegExp emailRegex = RegExp("^[a-z0-9._-]+@[a-z0-9._-]{2,}.[a-z]{2,4}");
  final RegExp numRegex = RegExp("^[+][0-9]+\$");

  final TextEditingController loyerController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Maison1"), value: "Maison1"),
      DropdownMenuItem(child: Text("Maisone2"), value: "Maisone2"),
      DropdownMenuItem(child: Text("Duplex2"), value: "Duplex2"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    String selectedValue = "Maisone2";
    int loyer = 0;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un locataire'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Inviter un locataire",
              style: kaHeading,
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              child: Column(children: <Widget>[
                IntlPhoneField(
                  searchText: "Chercher le pays",
                  invalidNumberMessage: "Numero invalide",
                  decoration: InputDecoration(
                      labelText: 'Numéro',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      )),
                  initialCountryCode: 'BJ',
                  validator: (value) {
                    _number = value!.completeNumber.toString();
                    if (!numRegex.hasMatch(_number)) {
                      return 'Entrez le numéro';
                    }
                    return null;
                  },
                  onChanged: (phone) {
                    // (value) =>
                    setState(() => _number = phone.completeNumber.toString());
                    print(_number);
                  },
                  controller: _numController,
                ),
                DropdownButtonFormField(
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
                TextFormField(
                  controller: loyerController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                    labelText: "En Fcfa",
                    hintText: "30000",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('nouveau locataire');

                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Nouveau locataire'),
                        content:
                            const Text('Enregistrement effectué avec succès'),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                            ),
                            onPressed: () {
                              Navigator.pop(context, 'okay');
                            },
                            child: Text("OKAY".toUpperCase()),
                          ),
                        ],
                      ),
                    );
                    // _userService
                    //     .save(UserModel(
                    //       telUser: _number,
                    //     ))
                    //     .then((value) => () {
                    //           TenancyModel tenancy = TenancyModel(
                    //             locataire: value.uid,
                    //             maison: selectedValue,
                    //             loyer: loyer,
                    //             dateEntre: DateTime.now(),
                    //           );
                    //           _firestore.collection('louer').doc().set({});
                    //         });
                  },
                  child: Text('Inviter'),
                )
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
