import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptthirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Recieptpreview extends StatelessWidget {
  final bool printbutton;
  const Recieptpreview({super.key,
  this.printbutton=true});

  
  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;

   
    return Scaffold(
      body: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black,width: 0.5,),color: Colors.green[100]),
                    
                  
                  margin: EdgeInsets.all(12),
                    height: screenheight*0.8,
                    width: screenwidth*0.9,
                    
                    child: Column(
                      children: [
                        Text("COMPANY NAME",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black,letterSpacing: 1.5),),
                        SizedBox(height: 10,),
                        Text("Official Receipt",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 16),),
                        Divider(thickness: 3,color: Colors.grey[400],),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Column(
                                  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Receipt Num:RC-2025-001",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Date: 21 Jan 2025"),
                                    Text("Time: 14:30 PM"),
                                    SizedBox(height: 10,),
                                    Text("Bill to:",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Client name: [Client Name]"),
                                     Text("Client address : [Client Address]"),
                                     Text("Client Phone :[Client Phone]"),
                                     SizedBox(height: 10,),
                                     
                                  ],
                                ),
                                             
                            ],
                          ),
                        ),
                        Divider(thickness: 1,color: Colors.black),
                        
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Subtotal :9700",style: TextStyle(fontSize: 16),),
                                  Text("Tax (5%)",style: TextStyle(fontSize: 16),),
                                  Text("Discount: ₹-185.00"),
                                    Text("Grand total :10000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                           
                                ],
                              
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Paid amount :3500",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                   Text("Balance :6500",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                   Text("Mode of transaction :Cash",style: TextStyle(fontWeight: FontWeight.bold),),
                                   Text("Due Date :30-10-25",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),) 
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("Thank you for the Purchase",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)
                      ],
                    ),
                ),
              ),

              SizedBox(height: 10,),
              if(printbutton)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombutton(label: "Back", onpressed:(){
                    Get.back();
                  }),
                  SizedBox(width: 10,),
                  Custombutton(label: "Print", onpressed: (){
                    Get.to(()=>Receiptthirdscreen());
                  }),
                ],
              )
              
            ],
          ),
    );

  }
}