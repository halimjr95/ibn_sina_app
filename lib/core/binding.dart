import 'package:get/get.dart';

import '../controller/layout_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
  }
}
