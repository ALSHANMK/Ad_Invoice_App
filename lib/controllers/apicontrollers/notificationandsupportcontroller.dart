import 'package:ad_invoice_mobile/Service/notificationandsupportservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Notificationandsupportcontroller extends GetxController{
  var isVisible=false.obs;
  var isloading=false.obs;
  var issuccess=false.obs;
  var notifications=<dynamic>[].obs;
  final Notificationandsupportservice notificationservice=Get.put(Notificationandsupportservice());

  void togglepanel()
  {
    isVisible.value=!isVisible.value;
  }

  Future<void> getnoti()async{

    try{
      isloading.value=true;
      final response=await notificationservice.getnotification();


      if (response['success'] == true && response['items'].isNotEmpty) {
      isVisible.value = true;
    }

      
      
    }
    catch(e)
    {
      print("error in controller $e");
    }
    finally
    {
      isloading.value=false;
    }
  }

Future <dynamic> submitsupo(String subject,String description)async{

    try{
      isloading.value=true;
      final payload={
        'subject':subject,
        'description':description,
      };

      final response=await notificationservice.submitsupport(payload);
      issuccess.value=response['success']==true;

      Get.snackbar(issuccess.value?"${response['message']}":"Couldnt submit ticket",
      issuccess.value?"Ticket id:${response['ticket']['id']} | Ticket status:${response['ticket']['status']}":"please try again",backgroundColor: issuccess.value?
      Colors.green[200]:Colors.red[200]);
      
    }
    catch(e)
    {
      print("error in controller $e");
    }
    finally{
      isloading.value=false;
    }
}


  
}