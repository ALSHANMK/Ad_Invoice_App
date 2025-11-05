import 'package:ad_invoice_mobile/controllers/apicontrollers/reportanalyricscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Reportscreen extends StatelessWidget {
  Reportscreen({super.key});

final Reportanalyricscontroller reportanalyricscontroller=Get.put(Reportanalyricscontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Report and Analysis"),
      backgroundColor: Colors.blue,),
      body: Column(
        children: [
          Obx(()=>SizedBox(
            height: 300,
            child: SfCartesianChart(
        backgroundColor: Colors.white,
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: "Monthly Share"),
        series: <CartesianSeries<Chartdata,dynamic>>[
          ColumnSeries<Chartdata,dynamic>(
            dataSource: [ Chartdata(category: 'Proposal',count :reportanalyricscontroller.proposalcount.value.toDouble()),
              Chartdata(category: 'Invoices',count: reportanalyricscontroller.invoicecount.toDouble()),
           
            Chartdata(category: 'Receipts',count:  reportanalyricscontroller.receiptcount.value.toDouble()),
            ],
            xValueMapper: (Chartdata data,_)=>data.category, 
            yValueMapper: (Chartdata data,_)=>data.count,
            
            )
        ],
      ),
          ),),
          Obx(()=>SizedBox(
            height: 250,
            child: SfCircularChart(
              title: ChartTitle(text: "Monthly share"),
              legend: Legend(isVisible: true),
              series: <CircularSeries>[
                PieSeries<Chartdata,dynamic>(
                  dataSource: [
                    Chartdata(category: 'Proposal',count: reportanalyricscontroller.proposalcount.value.toDouble()),
                    Chartdata(category: 'Invoices',count: reportanalyricscontroller.invoicecount.value.toDouble()),
                  
                  Chartdata(category: 'Receipts',count: reportanalyricscontroller.receiptcount.value.toDouble()),
                ],
                  xValueMapper: (Chartdata data,_)=>data.category,
                  yValueMapper: (Chartdata data,_)=>data.count,
                )
              ],
            ),
      
          ),),
      
          Custombutton(label: "back", onpressed: (){
           Get.back();
          })
        ],
      ),
    );
  }
}


class Chartdata{
  final String? category;
  final double? count;

  Chartdata({
    this.category,
    this.count,
  });
}

