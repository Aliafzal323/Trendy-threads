import 'package:flutter/material.dart';

class HomeModel {
  final IconData icon;
  final String title;

  HomeModel({required this.icon, required this.title});
  static List<HomeModel> items = [
    HomeModel(icon: Icons.sports, title: 'Sports'),
    HomeModel(icon: Icons.sports, title: 'Furniture'),
    HomeModel(icon: Icons.electric_bolt, title: 'Electronics'),
    HomeModel(icon: Icons.sports, title: 'Clothes'),
    HomeModel(icon: Icons.sports, title: 'Animals'),
  ];
}
