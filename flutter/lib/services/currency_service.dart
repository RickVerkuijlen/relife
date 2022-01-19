import 'package:am_awareness/components/voucher.dart';
import 'package:flutter/cupertino.dart';

class CurrencyService extends ChangeNotifier {
  late int currency;

  CurrencyService() {
    currency = 100;
  }

  void addCurrency(int amount) {

    currency += amount;
    print(currency);
  }

  void buyVoucher(Voucher voucher) {

  }
}