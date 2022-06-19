import 'package:flutter/material.dart';
import 'package:flututo/components/ElementStyle.dart';
import 'package:flututo/models/UserModel.dart';
import 'package:flututo/screens/guest/AuthCode.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class FormProfile extends StatefulWidget {
  final Function(UserModel) onChangeStep;

  const FormProfile({
    Key? key,
    required this.onChangeStep,
  }) : super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nomController = TextEditingController();
  final TextEditingController preController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whaController = TextEditingController();
  final RegExp emailRegex = RegExp("^[a-z0-9._-]+@[a-z0-9._-]{2,}.[a-z]{2,4}");
  final RegExp numRegex = RegExp("^[+][0-9]+\$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Text('Profil ', style: kaHeading),
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
                    controller: nomController,
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Prénom ', style: formLabel),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: preController,
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
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Email ', style: formLabel),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'john.doe@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      !emailRegex.hasMatch(emailController.text)
                          ? "Veuillez entrer un mail valide"
                          : null;
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 52.0),
                      primary: Theme.of(context).primaryColor,
                    ),
                    /*padding: EdgeInsets.symmetric(
                                  vertical: 15.0,
                                ),*/
                    onPressed: () {
                      //créer l'user model
                      widget.onChangeStep(UserModel(
                        telUser: AuthCodeScreen.phone,
                        nomUser: nomController.text.trim(),
                        preUser: preController.text.trim(),
                        mailUser: emailController.text.trim(),
                      ));
                    },
                    child: Text(
                      "Créer mon compte".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
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