import 'package:flutter/material.dart';
import 'package:flututo/components/ButtonWidget.dart';
import 'package:flututo/components/pappbar.dart';
import 'package:flututo/components/profile_widget.dart';
import 'package:flututo/models/user.dart';
import 'package:flututo/models/userpreferences.dart';

class ContInfo extends StatefulWidget {
  const ContInfo({
    Key? key,
  }) : super(key: key);

  @override
  _ContInfoState createState() => _ContInfoState();
}

class _ContInfoState extends State<ContInfo> {
  final bool _flag = true;
  final user = UserPreferences.myUser;
  final number = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildApBar(context),
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            buildName(user),
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {},
            ),

            const SizedBox(height: 24),
            Center(
              child: Text(
                user.number,
                style: TextStyle(fontSize: 21),
              ),
            ),
            const SizedBox(height: 40),

            //separation rose
            Container(
              // width: 10,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text(
                ' ',
              ),
            ),
            const SizedBox(height: 14),

            Container(
              width: 800,
              child: Text(
                'A propos ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            TextField(
              // hintText:
              onChanged: (text) {
                print('fist information: $text');
              },
            ),
            TextField(
              // hintText:
              onChanged: (text) {
                print('fist information: $text');
              },
            ),
            TextField(
              // hintText:
              onChanged: (text) {
                print('fist information: $text');
              },
            ),
            TextField(
              // hintText:
              onChanged: (text) {
                print('fist information: $text');
              },
            ),

            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: _flag ? Colors.pink : Colors.teal,
              ),
              child: Text("vérifier".toUpperCase()),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          // nom de lutilisteur
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),

          //email de lutilisateur
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Mettre à jour mon profil',
        onClicked: () {},
      );
}
