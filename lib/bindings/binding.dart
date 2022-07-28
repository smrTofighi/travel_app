import 'package:get/get.dart';
import 'package:travel_app/controllers/likeController.dart';
import 'package:travel_app/controllers/travelController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ImageController());
  }

}