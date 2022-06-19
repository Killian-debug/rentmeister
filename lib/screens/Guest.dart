import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flututo/models/UserModel.dart';
import 'package:flututo/screens/dashboard/Home.dart';
import 'package:flututo/screens/guest/Auth.dart';
import 'package:flututo/screens/guest/AuthCode.dart';
import 'package:flututo/screens/guest/FormProfile.dart';
import 'package:flututo/screens/guest/Password.dart';
import 'package:flututo/screens/guest/Term.dart';
import 'package:flututo/screens/services/CommonService.dart';
import 'package:flututo/screens/services/UserService.dart';

class GuestScreen extends StatefulWidget {
  GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();
  CommonService _commonService = CommonService();

  List<Widget> _widgets = [];

  int _indexSelected = 0;

  late String _verificationCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _commonService.terms.then((terms) => setState(() => _widgets.addAll([
          AuthScreen(
            onChangeStep: (index, value) => setState(() {
              print('VALue : ' + value);
              AuthCodeScreen.phone = value;
              _indexSelected = index;
            }),
          ),
          AuthCodeScreen(
            onChangeStep: (index, user) {
              print('authcode check ');

              _userService.save(user).then((value) {
                if (value.uid != null) {
                  print("le numcheck ");
                  setState(() => _indexSelected = index);
                }
              });
              //store registration details in firestore database
            },
          ),
          Term(
            terms: terms,
            onChangeStep: (index) => setState(() => _indexSelected = index),
          ),
          // Password(
          //     onChangeStep: (index, value) => setState(() {
          //           // _indexSelected = index!;
          //           if (index != null) {
          //             _indexSelected = index;
          //           }
          //           if (value != null) {
          //             _userService
          //                 .auth(UserModel(
          //               '',
          //               _email,
          //               value,
          //             ))
          //                 .then((value) {
          //               if (value.uid != null) {
          //                 setState(() => _indexSelected = index!);
          //               }
          //             });
          //           }
          //         })),
          FormProfile(
            onChangeStep: (user) => setState(
              () {
                print("okay");
                if (user != null) {
                  _userService.save(user).then((value) {
                    if (value.uid != null) {
                      print("ca passe");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  });
                }
              },
            ),
          ),
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.isEmpty
          ? SafeArea(
              child: Scaffold(
              body: Center(
                child: //Text('Chargement.. .')
                    SpinKitRing(
                  duration: Duration(milliseconds: 750),
                  color: Colors.blueAccent,
                ),
              ),
            ))
          : _widgets.elementAt(_indexSelected),
    );
  }
}
