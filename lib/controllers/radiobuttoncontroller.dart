import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Radiobuttoncontroller extends GetxController{

  

final RxList<int> selecteditemindex=<int>[].obs;
var filteredproduct=<Map<String,dynamic>>[].obs;
RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;

   @override
   void onInit(){
      super.onInit();
      
      
      WidgetsBinding.instance.addPostFrameCallback((_) {
      filteredproduct.assignAll(items);
    });
   }

   void _initializeSampleData() {
    if (items.isEmpty) {
      items.addAll([
        {
          "name": "Soap",
          "Price": 20,
          "Qnty": 4,
          "Category": "Product",
          "description": "Antibacterial body soap with moisturizing aloe vera and coconut oil. Gentle formula suitable for all skin types. Keeps skin fresh and hydrated throughout the day."
        },
        {
          "name": "Shampoo",
          "Price": 75,
          "Qnty": 2,
          "Category": "Product",
          "description": "Hair fall control shampoo with biotin and natural herbal extracts. Reduces breakage and strengthens hair roots. Leaves hair soft, shiny and manageable."
        },
        {
          "name": "Rice",
          "Price": 60,
          "Qnty": 10,
          "Category": "Product",
          "description": "Premium Basmati rice with distinctive aroma and long grains. Grows twice its size when cooked with non-sticky texture. Perfect for biryanis and traditional dishes."
        },
        {
          "name": "Notebook",
          "Price": 35,
          "Qnty": 3,
          "Category": "Product",
          "description": "200-page ruled notebook with durable hardcover and spiral binding. 70 GSM premium paper prevents ink bleeding. Ideal for students and professionals."
        },
        {
          "name": "Biscuits",
          "Price": 50,
          "Qnty": 5,
          "Category": "Product",
          "description": "Cream-filled chocolate biscuits in family pack. Made with premium ingredients and rich cocoa. Perfect for snacks and tea time enjoyment."
        },
        {
          "name": "Cleaning",
          "Rate": 200,
          "Workers": 1,
          "Category": "Service",
          "description": "General home cleaning including dusting, mopping, and surface cleaning"
        },
        {
          "name": "Laundry",
          "Rate": 180,
          "Workers": 1,
          "Category": "Service",
          "description": "Washing, drying, and folding of clothes and linens"
        },
        {
          "name": "Carpet Shampooing",
          "Rate": 250,
          "Workers": 2,
          "Category": "Service",
          "description": "Deep cleaning and shampooing of carpets and rugs"
        },
        {
          "name": "Window Washing",
          "Rate": 220,
          "Workers": 1,
          "Category": "Service",
          "description": "Interior and exterior window cleaning with streak-free finish"
        },
        {
          "name": "Sanitization",
          "Rate": 300,
          "Workers": 2,
          "Category": "Service",
          "description": "Professional sanitization service using hospital-grade disinfectants"
        }
      ]);
    }
  }


   void filtering(String query)
  {
      if(query.isEmpty)
      {
       filteredproduct.assignAll(items);
      }
      else{
      filteredproduct.assignAll(items.where((i)=>i['name'].toString().toLowerCase().contains(query.toLowerCase())));
      }
  }
    
  void selections(int index)
  {
    if(selecteditemindex.contains(index))
    {
      selecteditemindex.remove(index);
    }
    else{
      selecteditemindex.add(index);
    }
  

  }
  
  void updated(Map<String,dynamic>? oldlist,Map<String,dynamic> updated)
  {
    final index=items.indexWhere((p)=>identical(p, oldlist));
    if(index!=-1)
    {
      items[index]=updated;
      filtering('');
    }
  }
  



  
}