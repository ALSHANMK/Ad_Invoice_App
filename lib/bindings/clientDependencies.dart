import 'package:ad_invoice_mobile/Service/clientlistservice.dart';
import 'package:ad_invoice_mobile/Service/create_client_service.dart';
import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:get/get.dart';

class Clientdependencies {

  static void init(){
    Get.lazyPut(()=>CreateClientService());
    Get.lazyPut(()=>Clientlistservice());
    Get.lazyPut(()=>Userscontroller());
  }
}