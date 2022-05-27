import 'package:flutter/material.dart';

// list of all tenants with delete method

class Tenants extends StatefulWidget {
  Tenants({Key? key}) : super(key: key);

  @override
  State<Tenants> createState() => _TenantsState();
}

class _TenantsState extends State<Tenants> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Tenants page ( block of Tenants and infos"),
    );
  }
}
