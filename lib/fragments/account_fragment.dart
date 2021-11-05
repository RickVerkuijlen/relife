import 'package:flutter/material.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({Key? key}) : super (key: key);
  @override
  _AccountFragment createState() => _AccountFragment();
}

class _AccountFragment extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Welcome to the account page"),
        )
      ],
    );
  }
}