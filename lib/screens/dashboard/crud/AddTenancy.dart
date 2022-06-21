import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flututo/components/ElementStyle.dart';

List<DropdownMenuItem<String>> get propertiesItems {
  List<DropdownMenuItem<String>> freeProperties = [
    DropdownMenuItem(child: Text("Maison1"), value: "Maison1"),
    DropdownMenuItem(child: Text("Maisone2"), value: "Maisone2"),
    DropdownMenuItem(child: Text("Duplex2"), value: "Duplex2"),
  ];
  return freeProperties;
}

List<DropdownMenuItem<String>> get tenantsItems {
  List<DropdownMenuItem<String>> tenants = [
    DropdownMenuItem(child: Text("Choisir"), value: ''),
    DropdownMenuItem(child: Text("Adoul Mildave"), value: "Adoul Mildave"),
    DropdownMenuItem(child: Text("Gbedji Isaax"), value: "Gbedji Isaax"),
    DropdownMenuItem(child: Text("Raoul Wafo"), value: "Raoul Wafo"),
  ];
  return tenants;
}

class addTenancyPage extends StatefulWidget {
  addTenancyPage({Key? key}) : super(key: key);

  @override
  State<addTenancyPage> createState() => _addTenancyPageState();
}

class _addTenancyPageState extends State<addTenancyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _propertieSelected = '';
  String _tenantSelected = '';
  int _coutRep = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Choisissez la propriété à louer', style: formLabel),
            SizedBox(
              height: 5.0,
            ),
            DropdownButton(
                value: _propertieSelected,
                onChanged: (String? newValue) {
                  setState(() {
                    _propertieSelected = newValue!;
                  });
                },
                items: propertiesItems),
            Text('Choix du locataire :', style: formLabel),
            SizedBox(
              height: 5.0,
            ),
            DropdownButton(
                value: _tenantSelected,
                onChanged: (String? newValue) {
                  setState(() {
                    _tenantSelected = newValue!;
                  });
                },
                items: tenantsItems),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                labelText: "En Fcfa",
                hintText: "30000",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print('Nouvelle location');

                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Nouvelle location'),
                    content:
                        const Text('Cette location est désormais enregistrée.'),
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
              },
              child: Text('Enregistrer'),
            )
          ],
        ),
      ),
    );
  }
}
