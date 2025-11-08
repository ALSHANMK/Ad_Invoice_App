import 'package:ad_invoice_mobile/controllers/apicontrollers/listclientcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;

class Getproposalservice extends GetConnect{

  
  final Logincontroller logincontroller=Get.find<Logincontroller>();
  final Userscontroller userscontroller=Get.find<Userscontroller>();

  

@override
  void onInit() {
    httpClient.baseUrl="http://127.0.0.1:8000/api/";
    httpClient.timeout=Duration(seconds: 30);
   
    super.onInit();
  }
//getting proposal
  Future<dynamic> getproposal(String clientId)async{

   try{
    final encodedid = Uri.encodeComponent(clientId);
    print("encoded name is $encodedid");
     final response=await get("proposal/client/$encodedid/",headers: {
      'Authorization':'Bearer ${logincontroller.accesstoken.value}'
    });
    return response.body;
   }
   catch(e)
   {
    Get.snackbar("Error getting proposal", "$e");
   }
  }
//getting proposal item
  Future<dynamic> getproposalitems(String proposalid)async{
    try{
     
      final response=await get("proposal/$proposalid/items/",query: {
        "tenant":logincontroller.tenantid.value.toString(),
      },headers: {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      });
      return response.body;
    }
    catch(e)
    {
      Get.snackbar("Error fetchting proposal items", "$e");
      print("error fetching items $e");
    }
  }

//getting invoices
  Future<dynamic> getinvoices()async{
    try{
      final response=await get("invoices/list/",headers: {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      },query: {
        "tenant":logincontroller.tenantid.value.toString(),
      });
      return response.body;
    }
    catch(e)
    {
      print("error getting invoice $e");
    }
  }

  Future<dynamic> getinvoicedetails(String invoiceid)async{
    try{
      final response=await get("invoices/$invoiceid/",headers: {
        'Authorization':'Bearer ${logincontroller.accesstoken.value}'
      },query: {
        'tenant':logincontroller.tenantid.value.toString(),
      });
      return response.body;
      
    }
    catch(e)
    {
      print("error getting invoice details $e");
    }
  }

}