import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/userpreferences.dart';

AppBar buildApBar(BuildContext context) {
  const icon = CupertinoIcons.moon_stars;
  final name = UserPreferences.myUser.name;

  return AppBar(
    title: Text(name),
    leading: BackButton(color: Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(onPressed: () {}, icon: Icon(icon, color: Colors.pink))
    ],
  );
}
