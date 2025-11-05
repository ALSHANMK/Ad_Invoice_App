import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class Clientfulldetails extends StatelessWidget {
  Clientfulldetails({super.key});

  final client=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Client full details"),
      backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(client["name"] ?? "No Name", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("📧 ${client["email"]}"),
            Text("📞 ${client["phone"]}"),
            SizedBox(height: 10),
            Text("🏢 ${client["industry"]}"),
            Text("🏷️ ${client["tax_id"]}") ,
            Text("📝 ${client["registration_number"]}") ,
             Text("🗺️ ${client["address_line1"]}") ,
            Text("📍 ${client["city"]}, ${client["state"]}"),
            Text("🌍 ${client["country"]}"),
          ],
        ),
      ),
    );
  }
}