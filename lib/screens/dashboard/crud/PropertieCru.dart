import 'package:flutter/material.dart';

class addPropertiePage extends StatefulWidget {
  addPropertiePage({Key? key}) : super(key: key);

  @override
  State<addPropertiePage> createState() => _addPropertiePageState();
}

class _addPropertiePageState extends State<addPropertiePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Properties'),
      ),
      body: Center(
        child: Text("Add properties"),
      ),
    ));
  }
}
