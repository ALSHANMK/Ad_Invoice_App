import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Clientlistservice extends GetConnect{


  final Logincontroller logincontroller=Get.find<Logincontroller>();

  @override
  void onInit() {
   httpClient.baseUrl="http://127.0.0.1:8000/api/";
   httpClient.timeout=Duration(seconds: 30);
    super.onInit();
  }

  Future<dynamic> getclient()async{

    try{
      var tenant_id=logincontroller.tenantid.value;
      final response=await get("clients/list/$tenant_id/",headers: 
      {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      });
      return response.body;
    }
    catch(e)
    {
      throw "Error $e";
    }

  }

}