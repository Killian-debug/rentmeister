import 'package:flutter/material.dart';
import 'package:flututo/models/UserModel.dart';
import 'package:flututo/screens/dashboard/Home.dart';
import 'package:flututo/screens/guest/Auth.dart';
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

  List<Widget> _widget = [];

  int _indexSelected = 0;
  late String _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _commonService.terms.then((terms) => setState(() => _widget.addAll([
          AuthScreen(
            onChangeStep: (index, value) => setState(() {
              _indexSelected = index;
              _email = value;
            }),
          ),
          Term(
            terms: terms,
            onChangeStep: (index) => setState(() => _indexSelected = index),
          ),
          Password(
              onChangeStep: (index, value) => setState(() {
                    // _indexSelected = index!;
                    if (index != null) {
                      _indexSelected = index;
                    }

                    if (value != null) {
                      _userService
                          .auth(UserModel(
                        '',
                        _email,
                        value,
                      ))
                          .then((value) {
                        if (value.uid != null) {
                          setState(() => _indexSelected = index!);
                        }
                      });
                    }
                  })),
          FormProfile(
              onChangeStep: (index) => setState(() {
                    print("okay");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  })),
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.length == 0
          ? SafeArea(
              child: Scaffold(
              body: Center(
                child: Text('Loading...'),
              ),
            ))
          : _widget.elementAt(_indexSelected),
    );
  }
}
