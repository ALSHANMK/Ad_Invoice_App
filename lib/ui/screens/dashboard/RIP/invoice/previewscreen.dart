
import 'package:ad_invoice_mobile/controllers/apicontrollers/proposalcreationcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicethirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Previewscreen extends StatelessWidget {

  final bool printbutton;
   const Previewscreen({super.key,
   this.printbutton=true,
   });
   

  @override
  Widget build(BuildContext context) {
    

    final args=Get.arguments;
    final Proposalcreationcontroller proposalcreationcontroller=Get.find<Proposalcreationcontroller>();

      Widget buildinvoiceRow(String label,String value)
      {
        return Row(
          children: [
            Text(label,style: TextStyle(fontSize: 8),),
            Text(value,style: TextStyle(fontSize: 8),),
          ],
        );
      }


    final templatenum=args['template'];
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    final List<Map<String,dynamic>> items=args['items'];
    print(items);
    final Map<String,dynamic> client=args['client'];
    
    
    

    final allitems=items.map((item){
      return{
        'name':item['name'],
        'Qnty/Workers':item['quantity'],
        'Price/Rate':item['price'],
        'Category':item['item_type'],
      };
    }).toList();
   
    double totalBill = 0.0;
for (var item in items) {
  totalBill += double.parse(item['total'].toString());
}

double gst=0.0;
for(var item in items)
{
  gst+=double.parse(item['gst_rate'].toString());
}

double grand_total=gst+totalBill;


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
                                border: TableBorder.all(color: Colors.grey.shade300, width: 0.5),
                                columnWidths: const {
                                  0: FlexColumnWidth(1.2),
                                  1: FlexColumnWidth(1.2),
                                  2: FlexColumnWidth(1.6),
                                },
                                children: [
                                  // Header Row
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.blue[50],
                                    ),
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          "Bill To",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          "Ship To",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          "Invoice Details",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Details Row
                                  TableRow(
                                    children: [
                                      // Bill To
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${client['name'] ?? ''},",
                                                style: const TextStyle(fontSize: 8, height: 1.4)),
                                            if (client['Location'] != null)
                                              Text("${client['Location']}",
                                                  style: const TextStyle(fontSize: 8)),
                                            if (client['Company'] != null)
                                              Text("${client['Company']}", style: const TextStyle(fontSize: 8)),
                                          ],
                                        ),
                                      ),

                                      // Ship To (same as Bill To)
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${client['name'] ?? ''},",
                                                style: const TextStyle(fontSize: 8, height: 1.4)),
                                            if (client['Location'] != null)
                                              Text("${client['Location']}",
                                                  style: const TextStyle(fontSize: 8)),
                                            if (client['Company'] != null)
                                              Text("${client['Company']}", style: const TextStyle(fontSize: 8)),
                                          ],
                                        ),
                                      ),

                                      // Invoice Details
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            buildinvoiceRow('Invoice #:', '3211'),
                                            buildinvoiceRow('Date:', '21-01-2025'),
                                            buildinvoiceRow('P.O. #:', '123'),
                                            buildinvoiceRow('Due Date:', '23-02-2025'),
                                            buildinvoiceRow('Terms:', 'Net 30'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                                      
                                     ],
                                   ),
                                ),

                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.end,
                                                                   
                                     children: [
                                       Text("Total item Bill =$totalBill ",
                                            style:  TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none,)),
                                            Text("GST=$gst",style: TextStyle(fontSize: 10,color: Colors.black,decoration: TextDecoration.none),),
                                           
                                            Text("Grand Total=$grand_total",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
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
                                        
                                        await proposalcreationcontroller.createinvoice(client, items);
                                        if(proposalcreationcontroller.issucessinvo.value)
                                        {
                                          Get.snackbar("Success", "Invoice created",backgroundColor: Colors.green[200]);
                                          Get.to(Invoicethirdscreen(),arguments:Get.arguments);
                                        }
                                        else{
                                           Get.snackbar("Error", "Couldnt make invoice",backgroundColor: Colors.red[200]);
                                        }
                                      }),
                      ],
                    )
            
        ],
      );


  }
}