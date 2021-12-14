import 'package:flutter/material.dart';
import 'package:am_awareness/components/voucher.dart';

List<Voucher> voucher = [
  Voucher('images/bier.jpg', 'Gratis Biertje', '500', 'images/lokaal_99.jpg')
];

class ShopFragment extends StatefulWidget {
  const ShopFragment({Key? key}) : super (key: key);
  @override
  _AddFragment createState() => _AddFragment();
}

class _AddFragment extends State<ShopFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Welcome to the shop page"),
        )
      ],
    );
  }
}