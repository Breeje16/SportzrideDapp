import 'package:flutter/material.dart';

class Cards {
  late List<Color> color;
  late String name;
  late String icon;
  late String money;
  late String bank;

  Cards(
      {required this.name,
      required this.color,
      required this.money,
      required this.icon,
      required this.bank});
}

List<Cards> cardinfo = [
  Cards(
      name: "Breeje",
      color: const [Color(0xFFE96443), Color(0xFF904E95)],
      money: "5634.0",
      icon: "assets/images/logo.png",
      bank: 'assets/images/logo.png'),
];
