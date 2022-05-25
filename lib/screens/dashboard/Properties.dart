import 'package:flutter/material.dart';

// list of all properties with delete method
class Properties extends StatefulWidget {
  Properties({Key? key}) : super(key: key);

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Properties"),
      ),
      body: const Center(
        child: Text("Properties page ( block of properties and infos"),
      ),
    ));
    ;
  }
}
