import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trendy_threads/utils/loaders/loaders.dart';
import 'package:trendy_threads/utils/logging/logger.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      final status =
          results.isNotEmpty ? results.first : ConnectivityResult.none;
      updateConnectionStatus(status);
    });
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    _connectivityStatus.value = result;
    if (_connectivityStatus.value == ConnectivityResult.none) {
      Loaders.errorSnackBar(
          title: 'No Internnet',
          message: 'Please check your internet connection');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (result.isNotEmpty && !result.contains(ConnectivityResult.none)) {
        return true;
      } else {
        //For logging
        LoggerHelper.error('No internet');

        Loaders.errorSnackBar(
            title: 'No Internet',
            message: 'Please check your internet connection');
        return false;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
