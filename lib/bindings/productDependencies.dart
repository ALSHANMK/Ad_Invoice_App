import 'package:ad_invoice_mobile/Service/addproductservice.dart';
import 'package:ad_invoice_mobile/Service/productlistservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:get/get.dart';

class Productdependencies {

  static void init(){

    Get.lazyPut(()=>Addproductservice());
    Get.lazyPut(()=>Productlistservice());
  Get.lazyPut(()=>Productlistcontroller());
  }
}