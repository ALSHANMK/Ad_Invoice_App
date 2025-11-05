import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptthirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

class Recieptpreview extends StatelessWidget {
 
  final bool printbutton;
   Recieptpreview({super.key,
  this.printbutton=true});

  
  final Proposalcreationcontroller proposalcreationcontroller=Get.find<Proposalcreationcontroller>();
  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final args=Get.arguments;
    final invoice=args['items']['invoice'];
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
                        Text("${invoice['company_name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black,letterSpacing: 1.5),),
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
                                    Text("Receipt Num:${proposalcreationcontroller.receiptnum.value}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("${invoice['issue_date']}"),
                                   Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"),
                                    SizedBox(height: 10,),
                                    Text("Bill to:",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Client name: ${invoice['client_name']}"),
                                     Text("Client address : ${invoice['client_address']}"),
                                     Text("Client Phone :${invoice['client_phone']}"),
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
                                  Text("Subtotal :${invoice['subtotal']}",style: TextStyle(fontSize: 16),),
                                  Text("Tax ${invoice['total_gst']}",style: TextStyle(fontSize: 16),),
                                    Text("Grand total :${invoice['grand_total']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),       
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
                                  Text("Paid amount :${invoice['amount_paid']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                   Text("Balance :${invoice['balance_due']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                   Text("Mode of transaction :Cash",style: TextStyle(fontWeight: FontWeight.bold),),
                                   Text("Due Date :${invoice['due_date']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),) 
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
                  Custombutton(label: "Print", onpressed: ()async{
                   await proposalcreationcontroller.createrecip(invoice);
                   CircularProgressIndicator();
                    
                    if(proposalcreationcontroller.issucessreceipt.value)
                    {
                      
                      Get.to(()=>Receiptthirdscreen(),arguments: Get.arguments);
                    }
                    else{
                      Get.snackbar("Error creating receipt", "Please try again");
                    }
                  }),
                ],
              )
              
            ],
          ),
    );

  }
}