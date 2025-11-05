import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Usermanagementservice extends GetConnect{

  final Logincontroller logincontroller=Get.find<Logincontroller>();

  @override
  void onInit() {
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    httpClient.timeout=Duration(seconds: 30);
    super.onInit();
  }


  Future<dynamic> createuser(Map<String,dynamic> payload)async{

    final response=await post("users/user/create/${logincontroller.tenantid}/", payload,headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });
    return response.body;
  }


  Future<dynamic> getuser()async{

    final response=await get("users/user/${logincontroller.tenantid}/",headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });
    return response.body;
  
  }

  Future<dynamic> deleteuser(int userid)async{
 
    final response=await delete("users/user/$userid/delete/",headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    }, 
    );
    return response.body;
  }


  Future<dynamic> updateuser(Map<String,dynamic> body)async{

    final response=await put("users/user/update/<int:user_id>/", body,headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });
    return response.body;
  }
}