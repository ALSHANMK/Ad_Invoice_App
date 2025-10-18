import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class Itemeditscreen extends StatelessWidget {
  Itemeditscreen({super.key});

  final args=Get.arguments as Map<String,dynamic>;
  @override
  Widget build(BuildContext context) {

    final namecontroller=TextEditingController(text: args['name']);
    final pricecontroller=TextEditingController(text: args['Category']=='Product'?args['Price'].toString():args['Rate'].toString());
    final quantitycontroller=TextEditingController(text: args['Category']=='Product'?args['Qnty'].toString():args['Workers'].toString());
    final categorycontroller=TextEditingController(text: args['Category']);
    return Scaffold(
      appBar: AppBar(title: Text("Edit"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
        
              controller: namecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: Text("Name"),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: args["Category"]=='Product'?Text("Price"):Text("Rate per hour"),
              ),
              controller: pricecontroller,   
            ),
            SizedBox(height: 10,),
            TextField(
              controller: quantitycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                label: args['Category']=='Product'?Text("Quantity"):Text("Workers"),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: categorycontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                label: args['Category']=='Product'?Text("Quantity"):Text("Workers"),
              ),
            ),
            SizedBox(height: 10,),
            Custombutton(label: "Edit", onpressed: (){

              final updated=<String,dynamic>{
                'name':namecontroller.text,
                'Category':categorycontroller.text,
              };
              if(args['Category']=='Product')
              {
                updated['Price']=int.tryParse(pricecontroller.text)??0;
                updated['Qnty']=int.tryParse(quantitycontroller.text);
              }
              else if(args['Category']=='Service')
              {
                updated['Rate']=int.tryParse(pricecontroller.text)??0;
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