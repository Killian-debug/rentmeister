import 'package:flutter/material.dart';
import 'package:flututo/components/DashboardComponent.dart';
import 'package:flututo/components/NavigationSidebar.dart';
import 'package:flututo/screens/Guest.dart';
import 'package:flututo/screens/dashboard/DashboardIndex.dart';
import 'package:flututo/screens/dashboard/Properties.dart';
import 'package:flututo/screens/dashboard/Tenancy.dart';
import 'package:flututo/screens/dashboard/Tenants.dart';
import 'package:flututo/screens/dashboard/crud/AddPropertie.dart';
import 'package:flututo/screens/dashboard/crud/AddTenancy.dart';
import 'package:flututo/screens/dashboard/crud/AddTenant.dart';
import 'package:flututo/screens/services/UserService.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService _userService = UserService();

  PageController _pageController = PageController(
    initialPage: 0,
  );

  int currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bonjour username"),
        ),
        drawer: NavigationSidebar(
          changePage: changePage,
        ),
        floatingActionButton:
            dashboardComponent(context)[currentPageIndex].floatingActionButton,
        body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) =>
              dashboardComponent(context)[index].body,
        ),
      ),
    );
  }

  // int get currentPageIndex {
  //   return _pageController.page?.toInt() ?? 0;
  // }

  List<DashboardComponent> dashboardComponent(BuildContext context) {
    return [
      DashboardComponent(
        body: Dashboard(),
      ),
      DashboardComponent(
          body: PropertiesPage(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              //Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => addPropertiePage(),
                ),
              );
            },
          )),
      DashboardComponent(
          body: Tenancy(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              //  Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => addTenancyPage(),
                ),
              );
            },
          )),
      DashboardComponent(
          body: Tenants(),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => addTenantPage(),
                ),
              );
            },
          )),
    ];
  }

  void changePage(int? index) {
    _pageController.animateToPage(
      index!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    currentPageIndex = index;
    setState(() {});
  }
}
