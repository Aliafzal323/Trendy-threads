import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../shop/home/view/view.dart';

class NavigationController extends GetxController {
  final Rx<int> navigationIndex = 0.obs;
  final containers = [
    const HomePage(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];
}
