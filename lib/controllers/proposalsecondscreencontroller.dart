import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:get/get.dart';

class Proposalsecondscreencontroller extends GetxController{

  final Productlistcontroller productlistcontroller=Get.find<Productlistcontroller>();

  final RxList<int> selecteditemindex=<int>[].obs;
var filteredproduct=<Map<String,dynamic>>[].obs;
RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;
var isloading=false.obs;
@override
void onInit() {
  super.onInit();
  // Listen for changes in the products list
  ever(productlistcontroller.products, (products) {
    if (products.isNotEmpty) {
      
      populateuserfromapi(products);
    }
  });

  // Also, if the products are already loaded, we populate immediately.
  if (productlistcontroller.products.isNotEmpty) {
    populateuserfromapi(productlistcontroller.products);
  }
}

   void populateuserfromapi(List products)
  {
    try{
      isloading.value=true;
    final mappedprod=products.map((product){
      final usermap= {
        'name': product['name']?.toString() ?? 'Unknown',
        'price':product['price']?.toString()??'Not mentioned',
        'description':product['description']?.toString()??'Not mentioned',
        'type':product['type']?.toString()??'Not mentioned',
        'quantity':product['stock_quantity']?.toString(),
        'delivery':product['delivery_available']?.toString(),
        'id':product['id']?.toString(),
        
      };
      return usermap;
    },
    ).toList();
    items.assignAll(mappedprod);
    filteredproduct.assignAll(items);
    }
    catch(e)
    {
      throw "error $e";
    }
    finally{
      isloading.value=false;
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