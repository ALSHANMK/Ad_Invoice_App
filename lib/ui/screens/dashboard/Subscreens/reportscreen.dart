import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Reportscreen extends StatelessWidget {
  Reportscreen({super.key});

final data=<Sales>[
  Sales(month: "Jan", sales: 50),
  Sales(month: "Feb", sales: 40),
  Sales(month: "Mar", sales: 50),
  Sales(month: "Apr", sales: 60),
  Sales(month: "May", sales: 65),

];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: SfCartesianChart(
      backgroundColor: Colors.white,
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: "Monthly Sales"),
      series: <CartesianSeries<Sales,dynamic>>[
        ColumnSeries<Sales,String>(
          dataSource: data,
          xValueMapper: (Sales sales,_)=>sales.month, 
          yValueMapper: (Sales sales,_)=>sales.sales)
      ],
    ),
        ),
        SizedBox(
          height: 250,
          child: SfCircularChart(
            title: ChartTitle(text: "Monthly sales share"),
            legend: Legend(isVisible: true),
            series: <CircularSeries>[
              PieSeries<Sales,String>(
                dataSource: data,
                xValueMapper: (Sales sales,_)=>sales.month,
                yValueMapper: (Sales sales,_)=>sales.sales,
              )
            ],
          ),

        ),
      ],
    );
  }
}


class Sales{
  final String month;
  final double sales;

  Sales({
    required this.month,
   required this.sales
  });
}