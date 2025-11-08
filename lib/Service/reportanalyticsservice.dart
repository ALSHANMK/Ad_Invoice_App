import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';

class Reportanalyticsservice extends GetConnect{

  final Logincontroller logincontroller=Get.find<Logincontroller>();

  @override
  void onInit() {
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    super.onInit();
  }


  Future<dynamic> getreport()async{

    try{
      final response=await get("analytic/client-admin/analytics/${logincontroller.tenantid}/",headers: {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      });
      return response.body;
    }
    catch(e)
    {
      print("$e");
    }
  }
}