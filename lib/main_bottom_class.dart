import 'package:flutter/material.dart';

import 'fragments/account_fragment.dart';
import 'fragments/add_fragment.dart';
import 'fragments/home_fragment.dart';

class MainBottomClass extends StatefulWidget {
  const MainBottomClass({Key? key}) : super(key: key);

  @override
  _MainBottomClassState createState() => _MainBottomClassState();

}

class _MainBottomClassState extends State<MainBottomClass> {
  int selectedIndex = 0;

  final widgetOptions = [
    const HomeFragment(),
    const AddFragment(),
    const AccountFragment()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Home", "Add", "Account"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetTitle.elementAt(selectedIndex))
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
        unselectedItemColor: Colors.grey[300],
        selectedItemColor: const Color(0xffe50056),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}