import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flututo/screens/Guest.dart';
import 'package:flututo/screens/dashboard/Home.dart';
import 'package:flututo/screens/guest/Auth.dart';
import 'package:flututo/screens/guest/Term.dart';
import 'package:flututo/screens/services/UserService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application

  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RENTmeister',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: _userService.user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return HomeScreen();
              }
              return GuestScreen();
            }

            return SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text('Chargement...'),
                ),
              ),
            );
          },
        ));
  }
}
