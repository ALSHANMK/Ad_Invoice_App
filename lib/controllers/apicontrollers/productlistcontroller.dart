import 'package:ad_invoice_mobile/Service/productlistservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';

class Productlistcontroller extends GetxController{

  final Productlistservice productlistservice=Get.put(Productlistservice());
  final Logincontroller logincontroller=Get.find<Logincontroller>();

  


  var products=<dynamic>[].obs;
  var isloading=false.obs;

  @override
  void onInit() {
    getpro();
  
    super.onInit();
  }
  


  Future<void> getpro()async{

      try{
        isloading.value=true;
      final response=await productlistservice.getproduct(logincontroller.tenantid.value);
      products.value=response['items']??[];
      
      }
      catch(e)
      {
        Get.snackbar("Error", e.toString());
       
      }
      finally{
        isloading.value=false;
      }
      
  }

}