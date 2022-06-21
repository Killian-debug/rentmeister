import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flutter/services.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> intvState = [
    DropdownMenuItem(child: Text("Bon"), value: "bon"),
    DropdownMenuItem(child: Text("Moyen"), value: "moyen"),
    DropdownMenuItem(child: Text("En panne"), value: "en-panne"),
  ];
  return intvState;
}

class addEquipement extends StatefulWidget {
  addEquipement({Key? key}) : super(key: key);

  @override
  State<addEquipement> createState() => _addEquipementState();
}

class _addEquipementState extends State<addEquipement> {
  ScrollController _controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String selectedValue = "bon";
  int _coutRep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Enregistrer un bien'),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enregistrer un bien"),
              SizedBox(
                height: 15.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Nom', style: formLabel),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "lampe cuisine",
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Etat ', style: formLabel),
                    SizedBox(
                      height: 5.0,
                    ),
                    DropdownButton(
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
                    Text('Infos supplémentaire ', style: formLabel),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      minLines: 3,
                      decoration: InputDecoration(
                        labelText:
                            "La lampe grillée puis réparé de la cuisine ",
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
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 52.0),
                        primary: Colors.teal,
                      ),
                      /*padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),*/
                      onPressed: () {
                        print('Nouvelle intervention');

                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Nouvelle intervention'),
                            content: const Text(
                                'Cette intervention est désormais enregistrée.'),
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
                        // save interventions
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage(),
                        //   ),
                        // );
                      },
                      child: Text(
                        "Enregistrer".toUpperCase(),
                        style: buttonStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
