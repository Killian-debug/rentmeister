import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flutter/services.dart';

class addPropertiePage extends StatefulWidget {
  addPropertiePage({Key? key}) : super(key: key);

  @override
  State<addPropertiePage> createState() => _addPropertiePageState();
}

class _addPropertiePageState extends State<addPropertiePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController refController = TextEditingController();
  final TextEditingController addrController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  List<DropdownMenuItem<String>> get typeDropItems {
    List<DropdownMenuItem<String>> typeItems = [
      DropdownMenuItem(child: Text("immeuble"), value: "immeuble"),
      DropdownMenuItem(child: Text("appartement"), value: "appartement"),
    ];
    return typeItems;
  }

  @override
  Widget build(BuildContext context) {
    String? _typeSelected = 'appartement';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une propriété'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Référence unique', style: formLabel),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                controller: refController,
                decoration: InputDecoration(
                  labelText: "FIDJRO01",
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
              Text('Type: de la propriété :', style: formLabel),
              SizedBox(
                height: 5.0,
              ),
              DropdownButton(
                  value: _typeSelected,
                  onChanged: (newValue) {
                    setState(() {
                      _typeSelected = newValue as String?;
                    });
                  },
                  items: typeDropItems),
              TextFormField(
                minLines: 3,
                controller: addrController,
                decoration: InputDecoration(
                  labelText: "Adresse de la maison",
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
              TextFormField(
                minLines: 3,
                controller: descController,
                decoration: InputDecoration(
                  labelText: "Description",
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
                  print('Nouvelle maison');

                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Nouvelle propriété'),
                      content: const Text(
                          'Cette propriété est désormais enregistrée.'),
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
      ),
    ));
  }
}
