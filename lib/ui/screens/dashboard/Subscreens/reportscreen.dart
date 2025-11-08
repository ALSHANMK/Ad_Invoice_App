import 'package:ad_invoice_mobile/controllers/apicontrollers/reportanalyricscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Reportscreen extends StatelessWidget {
  Reportscreen({super.key});

  final Reportanalyricscontroller reportanalyricscontroller = Get.put(Reportanalyricscontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Analytics Dashboard",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Summary Cards
            Obx(() => Row(
              children: [
                _buildSummaryCard("Proposals", reportanalyricscontroller.proposalcount.value),
                SizedBox(width: 12),
                _buildSummaryCard("Invoices", reportanalyricscontroller.invoicecount.value),
                SizedBox(width: 12),
                _buildSummaryCard("Receipts", reportanalyricscontroller.receiptcount.value),
              ],
            )),
            
            SizedBox(height: 24),
            
            // Bar Chart
            Expanded(
              flex: 2,
              child: Obx(() => SfCartesianChart(
                backgroundColor: Colors.transparent,
                primaryXAxis: CategoryAxis(
                  labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                primaryYAxis: NumericAxis(
                  labelStyle: TextStyle(fontSize: 12),
                ),
                title: ChartTitle(
                  text: "Overview",
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                series: <CartesianSeries<Chartdata, String>>[
                  ColumnSeries<Chartdata, String>(
                    dataSource: [
                      Chartdata(category: 'Proposals', count: reportanalyricscontroller.proposalcount.value.toDouble()),
                      Chartdata(category: 'Invoices', count: reportanalyricscontroller.invoicecount.value.toDouble()),
                      Chartdata(category: 'Receipts', count: reportanalyricscontroller.receiptcount.value.toDouble()),
                    ],
                    xValueMapper: (Chartdata data, _) => data.category,
                    yValueMapper: (Chartdata data, _) => data.count,
                    color: Colors.blue[600],
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  )
                ],
              )),
            ),
            
            SizedBox(height: 16),
            
            // Pie Chart
            Expanded(
              flex: 2,
              child: Obx(() => SfCircularChart(
                title: ChartTitle(
                  text: "Distribution",
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                  textStyle: TextStyle(fontSize: 12),
                ),
                series: <CircularSeries>[
                  PieSeries<Chartdata, String>(
                    dataSource: [
                      Chartdata(category: 'Proposals', count: reportanalyricscontroller.proposalcount.value.toDouble()),
                      Chartdata(category: 'Invoices', count: reportanalyricscontroller.invoicecount.value.toDouble()),
                      Chartdata(category: 'Receipts', count: reportanalyricscontroller.receiptcount.value.toDouble()),
                    ],
                    xValueMapper: (Chartdata data, _) => data.category,
                    yValueMapper: (Chartdata data, _) => data.count,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              )),
            ),
            
            SizedBox(height: 16),
            
            // Back Button
            SizedBox(
              width: 120,
              child: Custombutton(
                label: "Back", 
                onpressed: () {
                  Get.back();
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, int count) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Chartdata {
  final String? category;
  final double? count;

  Chartdata({
    this.category,
    this.count,
  });
}