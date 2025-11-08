import 'package:ad_invoice_mobile/Service/loginservice.dart';
import 'package:ad_invoice_mobile/Service/registerservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';


class Authdependencies {

  static void init(){

    Get.lazyPut(() => Registerservice());
    Get.put(Loginservice());
    Get.put(Logincontroller());
  }
}