import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/emergency_invoice.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptsecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Receiptfirstscreen extends StatelessWidget {
  const Receiptfirstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    
    final Dropdowncontroller dropdowncontroller=Get.find<Dropdowncontroller>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Receipt"),
        backgroundColor: Colors.blue,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: screenwidth/3*1.3,
                  child: TextFormField(
                    maxLength: 10,
                    decoration: InputDecoration(
                      label: Text("Clients"),
                      
                      suffixIcon: Icon(Icons.person_search,color: Colors.blue,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      )
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(onPressed: (){
                Get.to(()=>EmergencyInvoice());
              }, label: Text("Emergency"),icon: Icon(Icons.emergency,color: Colors.red,size: 20,),),
            ],
          ),
          
          DropdownButton<String>(
            iconSize: 32,
            hint: Text("Select your invoice ",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
            elevation: 6,
            icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.blue,),
            items: <String>['Invoice 1','Invoice 2','Invoice 3','Invoice 4'].map((String value)=>DropdownMenuItem<String>(value: value,child: Text(value))).toList(),
            
            onChanged:dropdowncontroller.changedvalue ),

            SizedBox(height: 10,),

            Container(
              height: screenheight*0.35,
              width: screenwidth*0.85,
              
              margin: EdgeInsetsGeometry.all(12),
              child: Card(
                surfaceTintColor: Colors.blue,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Invoice ID: 3211",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Shipping to:Mike",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Location:Mumbai",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Date:16/10/25",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Due Date:30/10/25",style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Phone:966732490",style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: screenheight*0.15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(label: "Back", onpressed: (){}),
                SizedBox(width: 10,),
                Custombutton(label: "Next", onpressed: (){
                  Get.to(()=>Receiptsecondscreen());
                })
              ],
            )
            
        ],
      )
    );
  }
}