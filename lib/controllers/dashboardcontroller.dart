import 'package:get/get.dart';

class Dashboardcontroller extends GetxController{


  var selectedindex=0.obs;

  void changetab(int index)
  {
    selectedindex.value=index;
  }
}