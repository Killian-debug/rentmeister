import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';

class FormProfile extends StatefulWidget {
  final Function() onChangeStep;

  const FormProfile({
    Key? key,
    required this.onChangeStep,
  }) : super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  final bool _flag = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      margin: EdgeInsets.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  //height: 100,
                  width: 800,
                  child: Text('  Nom ', style: kaHeading),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "John ",
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
                Container(
                  //height: 100,
                  width: 800,
                  child: Text('Prénom ', style: kaHeading),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "baké ",
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
                Container(
                  //height: 100,
                  width: 800,
                  child: Text('Identifiant facebook ', style: kaHeading),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "John.coe ",
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
                Container(
                  //height: 100,
                  width: 800,
                  child: Text('  Numéro Whatsapp ', style: kaHeading),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "+229 62697749 ",
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
                  height: 10.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        _flag ? Color.fromARGB(255, 0, 47, 150) : Colors.teal,
                  ),
                  onPressed: () {
                    widget.onChangeStep();
                  },
                  child: Text("Créer mon compte".toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
/*
import 'package:flutter/material.dart';

class ProfilInfo extends StatefulWidget {
  const ProfilInfo({Key ?key}) : super(key: key);

  @override
  _ProfilInfoState createState() => _ProfilInfoState();
}

class _ProfilInfoState extends State<ProfilInfo> {
  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Profil ',style: kaHeading,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {  },
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "303069 ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(color: Colors.black ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(color: Colors.black ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: _flag ? Colors.pink : Colors.teal,
                          ),
                          /*padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),*/
                          onPressed: () => print('send code'),
                          child: Text("vérifier".toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
*/