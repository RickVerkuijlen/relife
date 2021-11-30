import 'package:flutter/material.dart';

class AddFragment extends StatefulWidget {
  const AddFragment({Key? key}) : super (key: key);
  @override
  _AddFragment createState() => _AddFragment();
}

class _AddFragment extends State<AddFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Welcome to the add page"),
        )
      ],
    );
  }
}