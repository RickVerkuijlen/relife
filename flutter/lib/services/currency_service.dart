import 'package:am_awareness/components/voucher.dart';
import 'package:flutter/cupertino.dart';

class CurrencyService extends ChangeNotifier {
  late int currency;

  CurrencyService() {
    currency = 1000;
  }

  void addCurrency(int amount) {

    currency += amount;

  }

  void buyVoucher(Voucher voucher) {

  }
}