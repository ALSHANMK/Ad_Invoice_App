
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class ProductServiceedit extends StatelessWidget {

  
  ProductServiceedit({super.key});

  final Map<String,dynamic>? product=Get.arguments;



  @override
  Widget build(BuildContext context) {
    final namecontroller=TextEditingController(text: product!['name']);
    final pricecontroller= TextEditingController(text: product!['Category']=='Product'?product!['Price'].toString():
    
  product!['Rate'].toString());
    final quantitycontroller=TextEditingController(text: product!['Category']=='Product'?product!['Qnty'].toString():
    product!['Workers'].toString());
    final categorycontroller=TextEditingController(text: product!['Category']);

    if(product==null)
    {
      return Scaffold(
        body: Text("No data received"),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: pricecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: product!['Category']=='Product'?Text("Price"):Text("Rate per hour"),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: quantitycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: product!['Category']=='Product'?Text("Quantity"):Text("Workers"),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: categorycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                label: Text("Category",style: TextStyle(fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 10,),
            Custombutton(label: "Edit", onpressed: (){

              final updated=<String,dynamic>{
                'name':namecontroller.text,
                'Category':categorycontroller.text,

              };

              if(product!['Category']=='Product')
              {
                 updated['Price']=int.tryParse(pricecontroller.text) ?? 0;
                updated['Qnty']=int.tryParse(quantitycontroller.text)??0;
              }

              else if(product!['Category']=='Service')
              {
                updated["Rate"]=int.tryParse(pricecontroller.text)??0;
                updated['Workers']=int.tryParse(quantitycontroller.text)??0;
              }
              
              Get.back(result: updated);
            })
          ],
          
        ),
      ),
    );
  }
}