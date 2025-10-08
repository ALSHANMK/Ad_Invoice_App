import 'package:get/get.dart';

class Productcontroller extends GetxController{

  var products=<Map<String,dynamic>>[
    {
      "name":"Glass",
      "price":120,
      "qnty":6,
      "category":"cloths",
    },
    {
      "name":"Shirt",
      "price":150,
      "qnty":3,
      "category":"cloths",
    },
    {
      "name":"Phone",
      "price":12000,
      "qnty":2,
      "category":"Electronics",
    },
    {
      "name":"Watch",
      "price":1200,
      "qnty":10,
      "category":"accesorries",
    },
    {
      "name":"Chain",
      "price":120000,
      "qnty":1,
      "category":"jewellery",
    },
    {
      "name":"Hat",
      "price":120,
      "qnty":100,
      "category":"cloths",
    },
    
  ].obs;

  var filteredproduct=<Map<String,dynamic>>[].obs;

  @override
  void onInit(){
    super.onInit();
    filteredproduct.assignAll(products);
  }

  void filterproducts(String query)
  {
    if(query.isEmpty)
    {
      return filteredproduct.assignAll(products);
    }
    else{
      filteredproduct.assignAll(products.where((p)=>p['name'].toString().toLowerCase().contains(query.toLowerCase())));
    }
  }


  void updateproduct(Map<String,dynamic> oldlist,Map<String,dynamic> updated)
  {
      final index=products.indexWhere((p)=>identical(p, oldlist));

      if(index!=-1)
      {
        products[index]=updated;
        filterproducts('');
      }
  }

  
}