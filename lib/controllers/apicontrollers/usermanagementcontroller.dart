import 'package:ad_invoice_mobile/Service/usermanagementservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usermanagementcontroller extends GetxController{

  @override
  void onInit() {
    getus();
    super.onInit();
  }

  var isloading=false.obs;
  var issuccess=false.obs;
  var users=[].obs;
  final Usermanagementservice usermanagementservice=Get.put(Usermanagementservice());
  final TextEditingController usernamecontroller=TextEditingController();
    final TextEditingController emailcontroller=TextEditingController();
    final TextEditingController passwordcontroller=TextEditingController();
    final TextEditingController firstnamecontroller=TextEditingController();
    final TextEditingController lastnamecontroller=TextEditingController();
    final TextEditingController rolecontroller=TextEditingController();


  Future<void> createus()async{

    try{
      isloading.value=true;

      final payload={
        "username": usernamecontroller.text,
        "email": emailcontroller.text,
        "password": passwordcontroller.text,
        "first_name":firstnamecontroller.text,
        "last_name": lastnamecontroller.text,
        "role": rolecontroller.text

      };


      final response=await usermanagementservice.createuser(payload);

      issuccess.value=response['message']=="User created successfully"?true:false;
      

      Get.snackbar(issuccess.value?"Success":"Failed", issuccess.value?"User created successfully":"${response['error']}",
      backgroundColor: issuccess.value?Colors.green[200]:Colors.red[200]);
      
    }
    catch(e)
    {
      Get.snackbar("Sorry", "$e");
    }
    finally{
      isloading.value=false;
    }
  }
  
  Future<void> getus()async{
    try{
      isloading.value=true;

      final response=await usermanagementservice.getuser();

      users.value=response['results'];
      print(users);
      //userid.value=users['id'];
      
  
    }
    catch(e)
    {
      Get.snackbar("failed to load users", "$e");
      
    }
    finally{
      isloading.value=false;
    }
  }

  Future<void> deleteus(int userid)async{
    try{
      isloading.value=true;


      final response=await usermanagementservice.deleteuser(userid);

    }
    catch(e)
    {
      print("error in deleting $e");
    }
    finally{
      isloading.value=false;
    }
  }

  Future<void> updateus()async{
    try{
      isloading.value=true;

      final payload={
         "username": usernamecontroller,
  "email": emailcontroller,
  "first_name": firstnamecontroller,
  "last_name": lastnamecontroller,
  "role": rolecontroller,
  "is_active": true,
      };

      final response=await usermanagementservice.updateuser(payload);
      print("Response is $response");
    }
    catch(e)
    {
      print(e);
    }
    finally{
      isloading.value=true;
    }
  }

  void clearfield(){
    usernamecontroller.clear();
    emailcontroller.clear();
    passwordcontroller.clear();
    firstnamecontroller.clear();
    lastnamecontroller.clear();
    rolecontroller.clear();
  }
}