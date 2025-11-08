import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';


class Roleservice extends GetConnect{

  final Logincontroller logincontroller=Get.find<Logincontroller>();
  @override
  void onInit() {
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    httpClient.timeout=Duration(seconds: 30);
    super.onInit();
  }


  Future<dynamic> createrole(Map<String,dynamic> payload)async{

    try{
      final response=await post("users/roles/${logincontroller.tenantid}/create/", payload,headers: {
       'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });

    return response.body;
    }
    catch(e)
    {
      throw "$e";
    }
  }

  Future<dynamic> listrole()async{
    final response=await get("users/roles/${logincontroller.tenantid}/list/",headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });

    return response.body;
  }

  Future<dynamic> deleterole(int roleid)async{
    try{
      final response=await delete("users/roles/$roleid/delete/",query: {
      "tenant":logincontroller.tenantid.value.toString(),
    },
    headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });
    return response.body;
    }
    catch(e)
    {
      Get.snackbar("Error", "$e");
    }
  }

  Future<dynamic> updaterole(Map<String,dynamic> payload,int roleid)async{

    try{
      final data={
        ...payload,
        "tenant":logincontroller.tenantid.value.toString(),
      };
      final response=await put("users/roles/$roleid/update/",data,
      headers: {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      } );
      return response.body;
    }
    catch(e)
    {
      Get.snackbar("Error", "$e");
    }
  }

  Future<dynamic> getpermissions()async{

    try{
      final response=await get("users/permissions/",headers: {
         'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      });
      return response.body;
    }
    catch(e)
    {
      Get.snackbar("Error", "$e");
    }
  }
}