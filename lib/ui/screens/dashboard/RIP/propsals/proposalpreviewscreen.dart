import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalthirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

class Proposalpreviewscreen extends StatelessWidget {

  final bool printbutton;
  const Proposalpreviewscreen({super.key,
  this.printbutton=true,
  });

  @override
  Widget build(BuildContext context) {

    final Proposalcreationcontroller proposalcreationcontroller=Get.put(Proposalcreationcontroller());
    Map<String,dynamic> data=Get.arguments;
    final selecteditems=data['items'] as List<Map<String,dynamic>>;
    final client=data['clients'];
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;

    final allitems=selecteditems.map((item){

      final isproduct=item['type']=='product';
      return{
        'name':item['name'],
        'Qnty/Workers':isproduct?item['quantity'].toString():item['quantity'].toString(),
        'Price/Rate':isproduct?item['price'].toString():item['price'].toString(),
        'Category':item['type'],
      };
}).toList();

print("Selected items are $selecteditems");
    
    /*final totalbill=selecteditems.fold(0.0, (sum,item)
    {
      final isproduct=item['type']=='product';
      final qnty_workers=isproduct?(item['stock']??0):(item['stock']??0);
      final price_rate=isproduct?(item['price']??0):(item['price']??0);
      final itemtotal=qnty_workers*price_rate;
      return sum+itemtotal;

    });
    final gst=(totalbill/12).ceil();
    final grandtotal=gst+totalbill;*/

    

    TextStyle cellstyle=TextStyle(color: Colors.black,fontSize: 12);

    return InteractiveViewer(
      minScale: 1,
      maxScale: 3,
      child: Expanded(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    width: screenwidth * 0.8,
                    height: screenheight * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/template1.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                
                
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Company Name",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                    
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text(
                                  "Proposal",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, 
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                
                              SizedBox(height: screenheight / 10),                
                               Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white
                                ),
                                 child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Send to\n${client['name']}",style: cellstyle,),
                                                      Text("${client['Location']}",style: cellstyle,)
                                                    ],
                                                  ),
        
                                                  Divider(height: 3,thickness: 2,color: Colors.black,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text("#${proposalcreationcontroller.proposalNumber}",style: TextStyle(fontSize: 8),),
                                                      Text("${proposalcreationcontroller.now}",style: TextStyle(fontSize: 8),),
                                                      Text(" P.O#:123",style: cellstyle,),
                                                      //Text("Due:${proposalcreationcontroller.calculateDueDate(date)}",style: cellstyle,),
                                                    ],
                                                 ),
                                              
                                                ],
                                              ),
                               ),
                          Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       SizedBox(height: 5),
                                      FittedBox(
                                        alignment: Alignment.topLeft,
                                        fit: BoxFit.scaleDown,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: DataTable(
                                            columnSpacing: 10,
                                            dataRowMinHeight: 14,
                                            dataRowMaxHeight: 18,
                                            headingRowHeight: 20,
                                            headingRowColor:
                                                WidgetStatePropertyAll(Colors.blue[50]),
                                            border: TableBorder.all(color: Colors.black),
                                            columns:  [
                                              DataColumn(
                                                  label: Text("Name",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 10))),
                                              DataColumn(
                                                  label: Text("Qty/workers",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 10))),
                                              DataColumn(
                                                  label: Text("Price/Rate",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 10))),
                                              DataColumn(
                                                  label: Text("Category",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 10))),
                                            ],
                                            rows: [...allitems
                                                .map(
                                                  (p) => DataRow(cells: [
                                                    DataCell(Text(p['name'].toString(),
                                                        )),
                                                    DataCell(Text(p['Qnty/Workers'].toString(),
                                                        )),
                                                    DataCell(Text(p['Price/Rate'].toString(),
                                                        )),
                                                    DataCell(Text(p['Category'].toString(),style: TextStyle(fontWeight: FontWeight.bold),
                                                        )),
                                                  ]),
                                                ),
                                            ]   
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenheight/14,),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text("Account Holder:${client['name']}\nBank name:${client['bank']}",
                                                style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                                Text("Branch:${client['Branch']}",style: TextStyle(fontSize: 12),),
                                         ],
                                       ),
                                    ),
        
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.end,
                                                                       
                                         children: [
                                           Text("Sub total = ₹${proposalcreationcontroller.calculateSubtotal(selecteditems).toString()}",
                                                style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                                Text("Gst = ₹${proposalcreationcontroller.calculateGST(selecteditems).toStringAsFixed(1)}",
                                                style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                                Divider(
                                                  thickness: 2,
                                                ),
                                                Text("Grand Total=${proposalcreationcontroller.calculateGrandTotal(selecteditems).toString()}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
        
                            ],
                          ),
                        ),
                 
                      ],
                    ),
                  ),
              ),
              
                SizedBox(height: 5,),
                       if(printbutton)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Custombutton(label: "Back", onpressed: Get.back),
                            SizedBox(width: 5,),
                            Custombutton(label: "Print", onpressed: ()async{
                             await proposalcreationcontroller.createproposal(client, selecteditems);
                                         try{
                                          if(proposalcreationcontroller.issucess.value)
                                         {
                                          Get.snackbar("Success", "Proposal created",backgroundColor: Colors.green[200]);
                                          Get.to(()=>Proposalthirdscreen(),arguments: Get.arguments);
                                         }
                                         else{
                                       
                                          Get.snackbar("Error", "Couldnt make proposal",backgroundColor: Colors.red[200]);
                                         }
                                         }
                                         catch(e)
                                         {
                                          Get.snackbar("Error ", "Couldnt make proposal");
                                         }
                                            
                                          }),
                          ],
                        )
                
            ],
          ),
      ),
    );
  }
}