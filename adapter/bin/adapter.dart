import 'dart:developer';

import 'package:intl/intl.dart';

void main(List<String> arguments) {
  PayX _payX = PayXImpl(
      amount: 10000000,
      customerName: 'PNST',
      creditCardNo: '0000-0000-0001-0002',
      expMonth: 7,
      expYear: 2023,cvv: 200);
  PayD _payD = PayDImpl(payXImpl: _payX);
  print(_payD.toString());
}

abstract class PayX {
  String get creditCardNo;
  String get customerName;
  int get cardExpMonth;
  int get cardExpYear;
  int get cardCVVNo;
  int get amount;
}

abstract class PayD {
  String get creditCardNo;
  String get customerName;
  DateTime get cardExpDate;
  int get cvvNo;
  int get amount;
}

class PayXImpl implements PayX {
  final int _amount;
  final int _cvv;
  final int _expMonth;
  final int _expYear;
  final String _creditCardNo;
  final String _customerName;

  PayXImpl(
      {int amount,
      int cvv,
      int expMonth,
      int expYear,
      String creditCardNo,
      String customerName})
      : _amount = amount,
        _cvv = cvv,
        _expMonth = expMonth,
        _expYear = expYear,
        _creditCardNo = creditCardNo,
        _customerName = customerName;

  @override
  int get amount => _amount;

  @override
  int get cardCVVNo => _cvv;

  @override
  int get cardExpMonth => _expMonth;

  @override
  int get cardExpYear => _expYear;

  @override
  String get creditCardNo => _creditCardNo;

  @override
  String get customerName => _customerName;
}

class PayDImpl extends PayD {
  final PayXImpl _payXImpl;

  PayDImpl({PayXImpl payXImpl}) : _payXImpl = payXImpl;

  @override
  int get amount => _payXImpl.amount;

  @override
  DateTime get cardExpDate => DateFormat('yyyy/MM')
      .parse('${_payXImpl.cardExpYear}/${_payXImpl.cardExpMonth}');

  @override
  String get creditCardNo => _payXImpl.creditCardNo;

  @override
  String get customerName => _payXImpl.customerName;

  @override
  int get cvvNo => _payXImpl.cardCVVNo;

  @override
  String toString() {
    return '$cardExpDate+$amount+$creditCardNo+$customerName+$cvvNo';
  }
}
