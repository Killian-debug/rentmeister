import 'package:flutter/material.dart';
import 'package:flututo/screens/dashboard/MyAccountPage.dart';

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
            children: <Widget>[buildHeader(context), buildMenuItems(context)]),
      ),
    );
  }

  // sidebar header
  Widget buildHeader(BuildContext context) {
    return Material(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {
          //close the navigation sidebar
          Navigator.pop(context);

          //go to myaccount
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AccountPage(),
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
            title: Text('Propriétés'),
            onTap: () {
              widget.changePage(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.key),
            title: Text('Locations'),
            onTap: () {
              widget.changePage(1);
            },
          ),
          const Divider(color: Colors.black54),
          ListTile(
            leading: const Icon(Icons.home_repair_service_rounded),
            title: const Text('Interventions'),
            onTap: () {
              widget.changePage(0);
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
