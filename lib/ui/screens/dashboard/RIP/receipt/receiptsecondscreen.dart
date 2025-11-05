import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/recieptpreview.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Receiptsecondscreen extends StatelessWidget {
  const Receiptsecondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args=Get.arguments;
    final invoice=args['items']['invoice'];
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Receipt"),backgroundColor:Colors.blue,),
      backgroundColor: Colors.blue[50],
      
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsetsGeometry.all(12),
              height: screenheight*0.6,
              width: screenwidth*0.8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
            
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                
                children: [
                   SizedBox(
                      width: screenwidth*0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Amount",style: TextStyle(fontWeight: FontWeight.bold,),),
                          SizedBox(height: 4,),
                          TextFormField(
                            readOnly: true,
                            initialValue: "${invoice['subtotal']}",
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.monetization_on,color: Colors.blue,),
                              //label: Text("10000",style: TextStyle(fontWeight: FontWeight.bold),),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Received Amount",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 4,),
                          TextFormField(
                            readOnly: true,
                            initialValue: "${invoice['amount_paid']}",
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.payment_outlined,color: Colors.blue,),
                             // label: Text("3000",style: TextStyle(fontWeight: FontWeight.bold),),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Payable",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 4,),
                          TextFormField(
                            readOnly: true,
                            initialValue: "${invoice['balance_due']}",
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.balance_sharp,color: Colors.blue,),
                              //label: Text("7000",style: TextStyle(fontWeight: FontWeight.bold),),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text("Due Date",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 4,),
                          TextFormField(
                            readOnly: true,
                            initialValue: "${invoice['due_date']}",
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.blue,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
            
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsetsGeometry.all(12),
              height: screenheight*0.2,
              width: screenwidth*0.8,
              
              child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombutton(label: "Back", onpressed: (){
                    Get.back();
                  }),
                  SizedBox(width: 15,),
                  Custombutton(label: "Next", onpressed: (){
                    Get.to(()=>Recieptpreview(),arguments: args);
                  }),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}