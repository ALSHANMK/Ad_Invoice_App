import 'package:ad_invoice_mobile/Service/reportanalyticsservice.dart';
import 'package:get/get.dart';

class Reportanalyricscontroller extends GetxController{

  final Reportanalyticsservice reportanalyticsservice=Get.put(Reportanalyticsservice());

  var isloading=false.obs;

  RxInt invoicecount=0.obs;
  RxInt proposalcount=0.obs;
  RxInt receiptcount=0.obs;
  RxInt productandservice=0.obs;

   @override
  void onInit() {
    super.onInit();
    getrepo();
  }

  
  
  Future<void> getrepo()async{

    try{
      isloading.value=true;

      final response=await reportanalyticsservice.getreport();
      
      if(response['success']==true)
      {
        invoicecount.value=response['invoice_count'];

      proposalcount.value=response['proposal_count'];

      receiptcount.value=response['receipt_count'];

      productandservice.value=response['product_and_service'];
      }

    }
    catch(e)
    {
      Get.snackbar("Couldnt get analytics", "$e");

    }
    finally{
      isloading.value=false;
    }
  }
}