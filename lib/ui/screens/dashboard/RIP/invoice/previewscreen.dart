
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicethirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Previewscreen extends StatelessWidget {

  final bool printbutton;
   Previewscreen({super.key,
   this.printbutton=true,
   });

  @override
  Widget build(BuildContext context) {

    final args=Get.arguments;

      Widget _buildinvoiceRow(String label,String value)
      {
        return Row(
          children: [
            Text("$label",style: TextStyle(fontSize: 8),),
            Text("$value",style: TextStyle(fontSize: 8),),
          ],
        );
      }


    final templatenum=args['template'];
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final List<Map<String,dynamic>> items=args['items'];
    final Map<String,dynamic> client=args['client'];

    final allitems=items.map((item){
      final isproduct=item['Category']=='Product';
      return{
        'name':item['name'],
        'Qnty/Workers':isproduct?item['Qnty']:item['Workers'],
        'Price/Rate':isproduct?item['Price']:item['Rate'],
        'Category':item['Category'],
      };
    }).toList();

    final totalbill=items.fold(0.0, (sum,item)
    {
      final isproduct=item['Category']=='Product';
      final qnty_item=isproduct?(item['Qnty']??0):(item['Workers']);
      final price_rate=isproduct?(item['Price']??0):(item['Rate']);
      final totalrate=qnty_item*price_rate;
      return sum+totalrate;
    });

    final gst=(totalbill/16).ceil();
    final grandtotal=totalbill+gst;

    final Map<int,Color> templatefontcolors={
      1:Colors.white,
      2:Colors.black,
    };
    TextStyle cellStyle = TextStyle(fontSize: 9,decoration: TextDecoration.none,fontWeight: FontWeight.bold);

    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
                width: screenwidth * 0.9,
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
                        "assets/template$templatenum.jpeg",
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
                                color: templatefontcolors[templatenum],
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Text(
                              "Invoice",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: templatefontcolors[templatenum],
                                fontSize: 16,
                              ),
                            ),
                          ),
            
                          SizedBox(height: screenheight / 10),
            
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              columnWidths: {
                                0:FlexColumnWidth(1.5),
                                1:FlexColumnWidth(1.5),
                                2:FlexColumnWidth(1.5),
                              },
                              border: TableBorder.all(color: Colors.white,width: 0),
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                  ),
                                  children: [
                                    Text("Bill To",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                                    
                                    Text("Ship To",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                                    
                                    Text("Invoice Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),),
                                    
                                    
                                  ]
                                ),
                                TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${client['name']},",style: TextStyle(fontSize: 8),),
                                          
                                          Text("${client['Location']}",style: TextStyle(fontSize: 8),),
                                         
                                          Text("${client['Company']}",style: TextStyle(fontSize: 8),),
                                          
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${client['name']}",style: TextStyle(fontSize: 8),),
                                          
                                          Text("${client['Location']}",style: TextStyle(fontSize: 8),),
                                          
                                          Text("${client['Company']}",style: TextStyle(fontSize: 8),),
                                          
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            _buildinvoiceRow('Invoice #:', '3211'),
                                            _buildinvoiceRow('Date:', '21-01-2025'),
                                            _buildinvoiceRow('P.O. #:', '123'),
                                            _buildinvoiceRow('Due Date:', '23-02-2025'),
                                            _buildinvoiceRow('Terms:', 'Net 30'),
                                        ],
                                      ),
                                    )
                                  ]
                                )
                              ],
                            )
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
                                                DataCell(Text(p['name'],
                                                    style: cellStyle)),
                                                DataCell(Text(p['Qnty/Workers'].toString(),
                                                    style: cellStyle)),
                                                DataCell(Text(p['Price/Rate'].toString(),
                                                    style: cellStyle)),
                                                DataCell(Text(p['Category'],
                                                    style: cellStyle)),
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
                                       Text("${client['name']}\n${client['bank']}",
                                            style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                            Text("${client['Location']}",style: TextStyle(fontSize: 12),),
                                     ],
                                   ),
                                ),

                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                                                   
                                     children: [
                                       Text("Total item Bill = ₹$totalbill",
                                            style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                            Text("GST=$gst",style: TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none),),
                                           
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
                                        Get.to(Invoicethirdscreen(),arguments:Get.arguments);
                                      }),
                      ],
                    )
            
        ],
      );


  }
}