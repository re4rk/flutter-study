import 'package:coinone_data/coinone.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

void main() {
  Future a = fetchMarket();
  a.then((value) => print(value), onError: (e) => print('asd$e'));

  runApp(const MyApp());
}
