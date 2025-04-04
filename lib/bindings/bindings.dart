import 'package:get/instance_manager.dart';
import 'package:trendy_threads/utils/http/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
