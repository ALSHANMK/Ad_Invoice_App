import 'package:get/get.dart';

class Dropdowncontroller extends GetxController{

  var selectedvalue= Rx<String?>(null);


  void changedvalue(String? newvalue)
  {
      if(newvalue!=null)
      {
        selectedvalue.value=newvalue;
      }
  }
}