import 'package:flutter/material.dart';

import 'fragments/account_fragment.dart';
import 'fragments/add_fragment.dart';
import 'fragments/home_fragment.dart';
import 'fragments/shop_fragment.dart';

class MainBottomClass extends StatefulWidget {
  const MainBottomClass({Key? key}) : super(key: key);

  @override
  _MainBottomClassState createState() => _MainBottomClassState();



}

class _MainBottomClassState extends State<MainBottomClass> {
  int selectedIndex = 0;

  final widgetOptions = [
    const HomeFragment(),
    const ShopFragment(),
    const AddFragment(),
    const AccountFragment()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Home", "Shop", "Add", "Account"];

  List<String> options = <String>['One', 'images/han-logo.png', 'images/han-lev.jpg', 'Four'];
  String dropdownValue = 'images/han-logo.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetTitle.elementAt(selectedIndex)),
        actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: const Image(image:AssetImage('images/han-logo.png'),
                  color: Colors.white, height: 80, width: 60,
                  ),
        )
      ),



        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 30),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_rounded, size: 30),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size: 30),
            label: "Account",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: const Color(0xffe50056),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}