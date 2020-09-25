import 'package:get/get.dart';

class DetailController extends GetxController {
  var count = RxInt()..value = 0;

  void increaseCount() {
    count.value = count.value + 1;
  }

  @override
  void onClose() {
    count.close();
    super.onClose();
  }
}
