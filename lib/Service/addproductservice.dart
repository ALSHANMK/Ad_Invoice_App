import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/get_core.dart';
import 'package:http/http.dart' as http;

class Addproductservice extends GetConnect{
  final Logincontroller logincontroller=Get.find<Logincontroller>();

    @override
  void onInit() {
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    httpClient.timeout=Duration(seconds: 30);
    super.onInit();
  }

  Future<dynamic> addproduct(Map<String,dynamic> data)async
  {
      try{
        final response=await post("products/create/", data,headers: {
          'Authorization':'Bearer ${logincontroller.accesstoken.value}',
          
          
        });
        
      return response.body;
      
      }
      catch(e)
      {
        throw "Error $e";
      }
  }
}