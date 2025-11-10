import 'package:ad_invoice_mobile/Service/clientlistservice.dart';
import 'package:get/get.dart';

class Listclientcontroller extends GetxController{

  final Clientlistservice clientlistservice=Get.find<Clientlistservice>();

  var clients=[].obs;
  var isloading=false.obs;

  @override
  void onInit() {
    getclients();
    super.onInit();
  }

  List get sortedclients{
    return [...clients]..sort((a, b) => 
    (a['name'] ?? '').toLowerCase().compareTo((b['name'] ?? '').toLowerCase()));
  }


  Future<void> getclients()async
  {
      try{
        isloading.value=true;
        final response=await clientlistservice.getclient();
        clients.value=response??[];
      }
      catch(e)
      {
        
        clients.value=[];
      }
      finally{
        isloading.value=false;
      }
  }
  
}