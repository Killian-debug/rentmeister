import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class addTenantPage extends StatefulWidget {
  addTenantPage({Key? key}) : super(key: key);

  @override
  State<addTenantPage> createState() => _addTenantPagetate();
}

class _addTenantPagetate extends State<addTenantPage> {
  final TextEditingController _numController = TextEditingController();

  String _number = '';
  //final RegExp emailRegex = RegExp("^[a-z0-9._-]+@[a-z0-9._-]{2,}.[a-z]{2,4}");
  final RegExp numRegex = RegExp("^[+][0-9]+\$");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Tenants'),
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
              ElevatedButton(
                onPressed: () {},
                child: Text('Inviter'),
              )
            ]))
          ],
        ),
      ),
    ));
  }
}
