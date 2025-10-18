import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/propsals/proposalthirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Proposalpreviewscreen extends StatelessWidget {

  final bool printbutton;
  const Proposalpreviewscreen({super.key,
  this.printbutton=true,
  });

  @override
  Widget build(BuildContext context) {

    Map<String,dynamic> data=Get.arguments;
    final selecteditems=data['items'] as List<Map<String,dynamic>>;
    final client=data['clients'];
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;

    final allitems=selecteditems.map((item){

      final isproduct=item['Category']=='Product';
      return{
        'name':item['name'],
        'Qnty/Workers':isproduct?item['Qnty']:item['Workers'],
        'Price/Rate':isproduct?item['Price']:item['Rate'],
        'Category':item['Category'],
      };
      
    }).toList();
    
    final totalbill=selecteditems.fold(0.0, (sum,item)
    {
      final isproduct=item['Category']=='Product';
      final qnty_workers=isproduct?(item['Qnty']??0):(item['Workers']??0);
      final price_rate=isproduct?(item['Price']??0):(item['Rate']??0);
      final itemtotal=qnty_workers*price_rate;
      return sum+itemtotal;

    });
    final gst=(totalbill/12).ceil();
    final grandtotal=gst+totalbill;

    

    TextStyle cellstyle=TextStyle(color: Colors.black,fontSize: 12);

    return InteractiveViewer(
      minScale: 1,
      maxScale: 3,
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
                                                    Text("Proposal NO: 3211",style: cellstyle,),
                                                    Text("Date:21-01-25",style: cellstyle,),
                                                    Text(" P.O#:   123",style: cellstyle,),
                                                    Text("Due Date:23-02-25",style: cellstyle,),
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
                                         Text("Total items Bill = ₹$totalbill",
                                              style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                              Text("Gst = ₹$gst",
                                              style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                              Divider(
                                                thickness: 2,
                                              ),
                                              Text("Grand Total=$grandtotal",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
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
                          Custombutton(label: "Preview", onpressed: (){
                                          Get.to(Proposalthirdscreen(),arguments:
                                          Map<String,dynamic>.from(Get.arguments));
                                        }),
                        ],
                      )
              
          ],
        ),
    );
  }
}