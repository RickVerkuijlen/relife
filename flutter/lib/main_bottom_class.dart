import 'package:am_awareness/services/currency_service.dart';
import 'package:flutter/foundation.dart';
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

  final currencyService = CurrencyService();
  late int currency = currencyService.currency;

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Text("$currency"),
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