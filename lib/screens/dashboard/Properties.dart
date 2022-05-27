import 'package:flutter/material.dart';

// list of all PropertiesPage with delete method
class PropertiesPage extends StatefulWidget {
  PropertiesPage({Key? key}) : super(key: key);

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("PropertiesPage page ( block of PropertiesPage and infos"),
    );
  }
}
