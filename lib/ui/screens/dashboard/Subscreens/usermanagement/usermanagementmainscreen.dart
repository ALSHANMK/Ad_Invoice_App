import 'package:ad_invoice_mobile/controllers/apicontrollers/usermanagementcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/listroles.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/usermanagementeditscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/usermanagementsecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Usermanagementmainscreen extends StatelessWidget {
  Usermanagementmainscreen({super.key});

  final Usermanagementcontroller usermanagementcontroller = Get.find<Usermanagementcontroller>();

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header with Action
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "User Management",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => Listroles());
                  },
                  icon: Icon(Icons.settings, size: 18),
                  label: Text("Roles"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.grey[800],
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
              ],
            ),
          ),

          // Users List
          Expanded(
            child: Obx(() => usermanagementcontroller.users.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.people_outline, size: 64, color: Colors.grey[300]),
                        SizedBox(height: 16),
                        Text(
                          "No users yet",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: usermanagementcontroller.users.length,
                    itemBuilder: (context, index) {
                      final user = usermanagementcontroller.users[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Card(
                          elevation: 1,
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue[100],
                              child: Icon(
                                Icons.person,
                                color: Colors.blue[700],
                                size: 20,
                              ),
                            ),
                            title: Text(
                              user['username'] ?? 'No name',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
  user['roles'] != null && user['roles'].isNotEmpty 
      ? user['roles'][0]['name'] ?? 'No Role'
      : 'No Roles',
  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
),
onLongPress: () {
                              Get.dialog(
      AlertDialog(
        title: Text("Delete User"),
        content: Text("Delete ${user['username']}? This cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
               await usermanagementcontroller.deleteus(user['id']);
              Get.back();
             
            },
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => Usermanagementeditscreen(), arguments: user);
                                  },
                                  icon: Icon(Icons.edit, color: Colors.blue[600], size: 20),
                                ),
                              ],
                            ),
                            
                          ),
                        ),
                      );
                    },
                  )),
          ),

          // Add User Button
          Container(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => Usermanagementsecondscreen());
                },
                icon: Icon(Icons.person_add, size: 20),
                label: Text("Add User"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 
}