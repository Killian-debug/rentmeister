import 'package:flutter/material.dart';
import 'package:flututo/screens/dashboard/MyAccountPage.dart';
import 'package:flututo/screens/dashboard/Properties.dart';
import 'package:flututo/screens/dashboard/Tenancy.dart';
import 'package:flututo/screens/dashboard/Tenants.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NavigationSidebar extends StatefulWidget {
  final Function(int?) changePage;

  NavigationSidebar({
    Key? key,
    required this.changePage,
  }) : super(key: key);

  @override
  State<NavigationSidebar> createState() => _NavigationSidebarState();
}

class _NavigationSidebarState extends State<NavigationSidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ]),
      ),
    );
  }

  // sidebar header
  Widget buildHeader(BuildContext context) {
    return Material(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {
          //go to myaccount page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyAccountPage(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(children: [
            CircleAvatar(
              radius: 52,
              child: Icon(Icons.person),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Amos Sivitra',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            Text(
              'amosmail@gmail.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          ]),
        ), // account information in the sidebar
      ),
    );
  }

// Menu items
  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () {
              Navigator.pop(context);
              widget.changePage(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: Text('Propri??t??s'),
            onTap: () {
              Navigator.pop(context);
              widget.changePage(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.key),
            title: Text('Locations'),
            onTap: () {
              Navigator.pop(context);
              widget.changePage(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: Text('Locataires'),
            onTap: () {
              Navigator.pop(context);
              widget.changePage(3);
            },
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.home_repair_service_rounded),
            title: const Text('Interventions'),
            onTap: () {
              widget.changePage(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_max_outlined),
            title: const Text('Autres'),
            onTap: () {
              widget.changePage(0);
            },
          ),
        ],
      ),
    );
  }
}
