import 'package:get/state_manager.dart';

class Notificationcontroller extends GetxController{

  var isVisible=false.obs;

  void togglepanel()
  {
    isVisible.value=!isVisible.value;
  }
}