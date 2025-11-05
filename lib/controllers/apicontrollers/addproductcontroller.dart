import 'package:ad_invoice_mobile/Service/addproductservice.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class Addproductcontroller extends GetxController{
  final Logincontroller logincontroller=Get.find<Logincontroller>();
  final Addproductservice addproductservice=Get.put(Addproductservice());

  var isloading=false.obs;
  var isactive=false.obs;
  var deliveryavail=false.obs;
  var isSuccess=false.obs;

  final typecontroller=TextEditingController();
  final categorycontroller=TextEditingController();
  final namecontroller=TextEditingController();
  final descriptioncontroller=TextEditingController();
  final pricecontroller=TextEditingController();
  final skucontroller=TextEditingController();
  final stockquantity=TextEditingController();

  Future<void> additem() async{
    if(isloading.value) return;

    try{
      isloading.value=true;
      final payload={
        "tenant": logincontroller.tenantid.value,
      "type": typecontroller.text.trim(), 
      "category": int.tryParse(categorycontroller.text.trim()), 
      "name": namecontroller.text.trim(), 
      "description":descriptioncontroller.text.trim(), 
      "price": pricecontroller.text.trim(), 
      "is_active": isactive.value, 
      "sku": skucontroller.text.trim(),
      "stock_quantity": int.tryParse(stockquantity.text.trim()), 
      "delivery_available":deliveryavail.value,
      };

      final response=await addproductservice.addproduct(payload);
       
      
      isSuccess.value = response['success'] == "Product/Service created successfully";

      final type=response['item']['type'];
      
      if(type=='product')
      {
        Get.snackbar(
        isSuccess.value?"Successfully added":"sorry,failed to add",
        isSuccess.value ? "Product created successfully" : "Failed to create product",
        backgroundColor: isSuccess.value?Colors.green[200]:Colors.red[200],
        icon: isSuccess.value?Icon(Icons.verified,color: Colors.green,):
        Icon(Icons.error,color: Colors.red,),
      );
      }
      else{
        Get.snackbar(
        isSuccess.value?"Successfully added":"sorry,failed to add",
        isSuccess.value ? "Service created successfully" : "Failed to create Service",
        backgroundColor: isSuccess.value?Colors.green[200]:Colors.red[200],
        icon: isSuccess.value?Icon(Icons.verified,color: Colors.green,):
        Icon(Icons.error,color: Colors.red,),
      );
      }
    }
    catch(e)
    {
      throw "Error $e";
      
    }
    finally{
      isloading.value=false;
    }
  }
  void clearfield(){
    typecontroller.clear();
    categorycontroller.clear();
    namecontroller.clear();
    descriptioncontroller.clear();
    pricecontroller.clear();
    skucontroller.clear();
    stockquantity.clear();
  }
  @override
  void onClose() {
   typecontroller.dispose();
    categorycontroller.dispose();
    namecontroller.dispose();
    descriptioncontroller.dispose();
    pricecontroller.dispose();
    skucontroller.dispose();
    stockquantity.dispose();
    super.onClose();
  }
}