import 'package:get/get.dart';
import 'package:user_list_rest_api/view/screens/home/controller/home_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///========================== Custom Controller ==================

    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
