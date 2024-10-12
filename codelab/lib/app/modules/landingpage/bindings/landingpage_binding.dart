import 'package:get/get.dart';

import '../controllers/landingpage_controller.dart';

class LandingpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingpageController>(
      () => LandingpageController(),
    );
  }
}
