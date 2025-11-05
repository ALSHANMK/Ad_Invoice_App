import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Proposalcreationservice extends GetConnect{

  final Logincontroller logincontroller=Get.find<Logincontroller>();

  @override
  void onInit() {
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    httpClient.timeout=Duration(seconds: 30);
    super.onInit();   
  }
  Future<dynamic> createprop(Map<String,dynamic> data)async
    {
        try{
          var response=await post('proposal/create/', data,headers: {
          'Authorization':'Bearer ${logincontroller.accesstoken.value}'
        });
        return response.body;
        }
        catch(e)
        {
          print("Error in porposal creation,$e");
        }
    }

    //invoice creation
    Future<dynamic> createinvo(Map<String,dynamic> data)async{
      try{
        var response=await post("invoices/create/", data,headers: {
          'Authorization':'Bearer ${logincontroller.accesstoken.value}'
        });
        return response.body;
      }
      catch(e)
      {
        print("Error in invoice creation $e");
      }
    }

    //receipt creation
     Future<dynamic> createreceipt(Map<String,dynamic> data)async
  {
    try{
      final response=await post("receipts/create/", data);
      return response.body;
    }
    catch(e)
    {
      print("error creating receipt $e");
    }
  }
}