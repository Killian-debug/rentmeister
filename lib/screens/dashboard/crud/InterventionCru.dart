import 'package:flutter/material.dart';

class addInterventionPage extends StatefulWidget {
  addInterventionPage({Key? key}) : super(key: key);

  @override
  State<addInterventionPage> createState() => _addInterventionPageState();
}

class _addInterventionPageState extends State<addInterventionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Interventions'),
      ),
      body: Center(
        child: Text("Add Interventions"),
      ),
    ));
  }
}
