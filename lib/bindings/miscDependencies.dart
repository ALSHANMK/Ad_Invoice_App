import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/controllers/radiobuttoncontroller.dart';
import 'package:get/get.dart';

class Miscdependencies {

  static void init(){

  Get.put(Dropdowncontroller());
  Get.put(Radiobuttoncontroller());
  }
}