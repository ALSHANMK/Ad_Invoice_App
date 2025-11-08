import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';

class Notificationandsupportservice extends GetConnect {
final Logincontroller logincontroller=Get.find<Logincontroller>();
  @override
  void onInit() {
   httpClient.baseUrl="http://127.0.0.1:8000/api/";
    super.onInit();
  }

  Future<dynamic> getnotification()async{

    try{
      final response=await get("notifications/list/",headers:{
        'Authorization':'Bearer ${logincontroller.accesstoken.value}',
        'Content-Type':'application/json'
      } );
      return response.body;
    }
    catch(e)
    {
      print("Error getting notification $e");
    }
  }


  Future<dynamic> submitsupport(Map<String,dynamic> data)async{

    try{
      final response=await post("support/create/", data,headers: {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}',
      });
      return response.body;
    }
    catch(e)
    {
      print("Problem in submitting issue");
    }
  }
}