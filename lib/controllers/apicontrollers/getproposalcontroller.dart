import 'package:ad_invoice_mobile/Service/getproposalservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Getproposalcontroller extends GetxController{

  final Getproposalservice getproposalservice=Get.put(Getproposalservice());

  final proposal=[].obs;
  final isloading=false.obs;
  final invoice=[].obs;



  Future<void> getprop(String clientname)async{

    try{
      isloading.value=true;
      final response=await getproposalservice.getproposal(clientname);

     
 



if (response['success'] == true && response['proposals'] is List) {

  proposal.value = response['proposals'];
  
  Get.snackbar(
    "Proposals fetched", 
    "Found ${proposal.length} proposals",
    backgroundColor: Colors.green[200]
  );
} else {
  proposal.value = []; 
  Get.snackbar(
    "No proposals", 
    "Could not find any proposals",
    backgroundColor: Colors.red[200]
  );
}
      
    }
    catch(e)
    {
      Get.snackbar("Controller error", "$e");
    }
    finally{
      isloading.value=false;
    }

  }

  Future<List<dynamic>?> getpropitem(String proposalid)async{

    try{
      isloading.value=true;
      final response= await getproposalservice.getproposalitems(proposalid);
      return response;
      

    }
    catch(e)
    {
      Get.snackbar("Error in fetching proposal items", "$e");
    }
    finally{
      isloading.value=false;
    }
    return null;

  }

  Future<void> getinvo()async{
    try{
      isloading.value=true;
      final response=await getproposalservice.getinvoices();
      invoice.value=response['invoices'];
    }
    catch(e){
      print("Error in getting invoices $e");
    }
    finally{
        isloading.value=false;
    }
  }
  Future<Map<String,dynamic>?> getinvodetails(String invoiceid)async{
    try{
      isloading.value=true;
      final response=await getproposalservice.getinvoicedetails(invoiceid);
      return response;
        
    }
    catch(e)
    {
      Get.snackbar("error fetching invoice details", "$e");
    }
    finally{
      isloading.value=false;
    }
    return null;
  }
  
}