import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return //SafeArea(
        //child:
        Scaffold(
      appBar: AppBar(
        title: Text("Hi Username"),
      ),
      body: Center(
        child: Text(
          "User account page ( personal inforation about user)",
        ),
      ),
    )
        //);
        ;
  }
}
