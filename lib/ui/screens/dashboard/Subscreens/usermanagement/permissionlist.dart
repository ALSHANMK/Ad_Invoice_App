import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Permissionlist extends StatelessWidget {
   Permissionlist({super.key});

  final permission=Get.arguments;
 

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Permissions"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "All Permissions",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "List of available system permissions",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),
            

            Expanded(
              child: ListView.builder(
                itemCount: permission.length, 
                itemBuilder: (context, index) {
                  final permi=permission[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.security,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        "${permi['code']}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "${permi['description']}",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Text(
                        "ID:${permi['id']}",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                          
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}