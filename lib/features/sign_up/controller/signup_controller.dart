import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  final email = TextEditingController();
  final firstName = TextEditingController();

  final lastName = TextEditingController();

  final userName = TextEditingController();

  final phoneNumber = TextEditingController();

  final password = TextEditingController();
}
