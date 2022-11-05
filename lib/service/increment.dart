import 'package:get/get.dart';

class IncrementService extends GetxController {
  var num = 1.obs;

  increment() {
    num++;
  }
}
