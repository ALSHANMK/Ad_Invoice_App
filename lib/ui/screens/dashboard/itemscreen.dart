import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewproductscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/addnewservicescreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/product_servicefulldetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Itemscreen extends StatelessWidget {
  const Itemscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Productlistcontroller productlistcontroller=Get.put(Productlistcontroller());

    final screenheight=MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey
          ,tabs:[
            Tab(text: "Product",),
            Tab(text: "Service",),
          ]),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              SizedBox(
                height: screenheight/2*1.2,
                child: Obx(()=>ListView.builder(
                  itemCount: productlistcontroller.products.where((item)=>item['type']=='product').length,
                  itemBuilder: (context,index)
                {
                  final product=productlistcontroller.products.where((item)=>item['type']=='product').toList()[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        Get.to(()=>ProductServicefulldetails(),arguments: product);
                      },
                      leading: Icon(Icons.shopping_bag),
                      title: Text(product['name']),
                    ),
                  );
                }),)
              ),
              SizedBox(
                  width: 200,
                  child: Custombutton(label: "Add new product", onpressed: (){
                    Get.to(()=>Addnewproductscreen());
                  }),
                ),
            ],
          ),
          

          Column(
            children: [
              SizedBox(
                height: screenheight/2*1.2,
                child: Obx(()=>ListView.builder(
                  
                  itemCount: productlistcontroller.products.where((item)=>item['type']=='service').length,
                  itemBuilder: (context,index)
                {
                  final service=productlistcontroller.products.where((item)=>item['type']=='service').toList()[index];
                  return Card(
                    margin: EdgeInsets.all(20),
                    child: ListTile(
                      onTap: () {
                        Get.to(()=>ProductServicefulldetails(),arguments: service);
                      },
                      leading: Icon(Icons.home_repair_service),
                      title: Text(service['name']),
                    ),
                  );
                }),)
              ),
               SizedBox(
                  width: 200,
                  child: Custombutton(label: "Add new service", onpressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Addnewservicescreen()));
                  }),
                ),
            ],
          ),
         
          
        ]
        
        ),
        
        
      ),
      
    );
    
  }
}