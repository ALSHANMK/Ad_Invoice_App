import 'package:ad_invoice_mobile/controllers/apicontrollers/listclientcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userscontroller extends GetxController{

 final Listclientcontroller listclientcontroller=Get.find<Listclientcontroller>();
  var filteredusers=<Map<String,dynamic>>[].obs;

  final RxInt selecteduser=(-1).obs;
  RxList<Map<String,dynamic>> users=<Map<String,dynamic>>[].obs;

  @override
  void onInit()
  {
    super.onInit();
    
    if(listclientcontroller.clients.isNotEmpty)
    {
      final sortedclients=listclientcontroller.sortedclients;
      populateuserfromapi(sortedclients);

      
    }
    else{
         WidgetsBinding.instance.addPostFrameCallback((_)
   {
     if (listclientcontroller.clients.isNotEmpty) {
          final sortedclients = listclientcontroller.sortedclients;
          populateuserfromapi(sortedclients);
        }
   });
    }


  }

  void populateuserfromapi(List clients)
  {
    final mappedusers=clients.map((client){
      final usermap= {
        'id':client['id']?.toString(),
        'name': client['name']?.toString() ?? 'Unknown',
      'industry': client['industry']?.toString() ?? 'Unknown Company',
      'Location': client['city']?.toString() ?? 'Unknown Location',
      'tax_id':client['tax_id']?.toString(),
      'address':client['address_line1']?.toString(),
      'email':client['email']?.toString(),
      'phone':client['phone']?.toString(),
      'logo':client['logo'],
        
      };
      return usermap;
    },
    ).toList();
    users.assignAll(mappedusers);
    filteredusers.assignAll(users);
  }

  void filtering(String query) {
  // Reset selection when search changes
  selecteduser.value = -1;
  
  // Your existing filtering logic
  if (query.isEmpty) {
    filteredusers.value = users;
  } else {
    filteredusers.value = users.where((user) {
      final name = user['name']?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
  }
}

  void selection(int index)
  {
    if(selecteduser.value==index)
    {
      selecteduser.value=-1;
    }
    else {
      selecteduser.value=index;
    }
  }

  Map<String,dynamic>? get userinfo{
    if(selecteduser.value >=0 && selecteduser.value<users.length)
    {
      return users[selecteduser.value];
    }
    return null;
  }
}