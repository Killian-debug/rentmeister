import 'package:flutter/material.dart';
import 'package:flututo/components/NavigationSidebar.dart';
import 'package:flututo/screens/Guest.dart';
import 'package:flututo/screens/dashboard/DashboardIndex.dart';
import 'package:flututo/screens/dashboard/Properties.dart';
import 'package:flututo/screens/dashboard/Tenants.dart';
import 'package:flututo/screens/services/UserService.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService _userService = UserService();

  final PageController _pageController = PageController();
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
        body: PageView(
          controller: _pageController,
          children: [
            Dashboard(),
            Properties(),
            Tenants(),
          ],
        ),
      ),
    );
  }

  void changePage(int? index) {
    _pageController.animateToPage(
      index!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
