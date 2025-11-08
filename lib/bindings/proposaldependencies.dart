import 'package:ad_invoice_mobile/Service/getproposalservice.dart';
import 'package:ad_invoice_mobile/Service/proposalcreationservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/getproposalcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/controllers/proposalsecondscreencontroller.dart';
import 'package:get/get.dart';

class Proposaldependencies {


  static void init(){

    Get.lazyPut(()=>Proposalcreationservice());
  Get.lazyPut(()=>Proposalsecondscreencontroller());
  Get.lazyPut(()=>Proposalcreationcontroller());
  Get.lazyPut(()=>Getproposalcontroller());
  Get.lazyPut(()=>Getproposalservice());
  }
}