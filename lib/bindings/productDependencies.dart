import 'package:ad_invoice_mobile/Service/addproductservice.dart';
import 'package:ad_invoice_mobile/Service/productlistservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/addproductcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:get/get.dart';

class Productdependencies {

  static void init(){

     Get.lazyPut(()=>Productlistservice(),fenix: true);
     Get.lazyPut(()=>Addproductservice(),fenix: true);
     Get.lazyPut(()=>Productlistcontroller(),fenix: true);
     Get.lazyPut(()=>Addproductcontroller(),fenix: true);
  }
}