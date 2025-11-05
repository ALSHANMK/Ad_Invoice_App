import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class ProductServicefulldetails extends StatelessWidget {

  ProductServicefulldetails({super.key,});

  final products=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(products['name'] ?? "No Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("💰 ₹${products['price'] ?? '0.00'}"),
            Text("📦 ${products['type']?.toUpperCase() ?? 'PRODUCT'}"),
            SizedBox(height: 10),
            Text("📝 ${products['description'] ?? 'No description'}"),
            Text("🏷️ Stock: ${products['stock_quantity'] ?? 0}"),
            Text("🚚 ${products['delivery_available'] == true ? 'Delivery Available' : 'No Delivery'}"),
            Text("${products['is_active'] == true ? '✅ Active' : '❌ Inactive'}"),
            SizedBox(height: 30),
            Center(
              child: Custombutton(label: "back", onpressed: (){
                Get.back();
              }),
            )
          ],
        ),
      ),
    );
  }
}