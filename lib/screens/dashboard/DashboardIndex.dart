import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return //SafeArea(
        //child:
        Scaffold(
      appBar: AppBar(
        title: Text("Hi Username"),
      ),
      body: Center(
        child: Text("Dashboard ( block of properties, tenancies, tenants"),
      ),
    );
    //);
  }
}
