import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flutter/services.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> intvState = [
    DropdownMenuItem(child: Text("Crée"), value: "creer"),
    DropdownMenuItem(child: Text("En cours"), value: "en-cours"),
    DropdownMenuItem(child: Text("Terminé"), value: "termine"),
  ];
  return intvState;
}

class addInterventionPage extends StatefulWidget {
  addInterventionPage({Key? key}) : super(key: key);

  @override
  State<addInterventionPage> createState() => _addInterventionPageState();
}

class _addInterventionPageState extends State<addInterventionPage> {
  ScrollController _controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String selectedValue = "creer";
  int _coutRep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Interventions'),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Enregistrer un intervention"),
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
                    Text('Titre', style: formLabel),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Changement de lampe ",
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
                    Text('Description ', style: formLabel),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextFormField(
                      minLines: 3,
                      decoration: InputDecoration(
                        labelText:
                            "réparation de la lampe grillée de la cuisine ",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Cout de la réparation ', style: formLabel),
                            SizedBox(
                              height: 5.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              decoration: InputDecoration(
                                labelText: "En Fcfa",
                                hintText: "30000",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Etat de l\'intervention', style: formLabel),
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
                          ],
                        )
                      ],
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
