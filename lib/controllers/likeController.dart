import 'package:get/get.dart';
import 'package:travel_app/models/TravelModel.dart';

class LikeController extends GetxController{
  RxBool liked = false.obs;

  void Liked(int index){
    liked.value = !liked.value;
    travelList[index].like = liked.value;
  }
}