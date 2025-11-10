import 'package:ad_invoice_mobile/Service/getproposalservice.dart';
import 'package:ad_invoice_mobile/Service/proposalcreationservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/getproposalcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/controllers/proposalsecondscreencontroller.dart';
import 'package:get/get.dart';

class Proposaldependencies {


  static void init(){

  Get.lazyPut(()=>Getproposalservice(),fenix: true);
  Get.lazyPut(()=>Proposalcreationservice(),fenix: true);
  Get.lazyPut(()=>Proposalsecondscreencontroller(),fenix: true);
  Get.lazyPut(()=>Proposalcreationcontroller(),fenix: true);
  Get.lazyPut(()=>Getproposalcontroller(),fenix: true);
  
  }
}