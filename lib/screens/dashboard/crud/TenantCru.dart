import 'package:flutter/material.dart';

class addTenantPage extends StatefulWidget {
  addTenantPage({Key? key}) : super(key: key);

  @override
  State<addTenantPage> createState() => _addTenantPagetate();
}

class _addTenantPagetate extends State<addTenantPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Add Tenants'),
      ),
      body: Center(
        child: Text("Add Tenants"),
      ),
    ));
  }
}
