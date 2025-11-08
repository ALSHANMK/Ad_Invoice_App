import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:ad_invoice_mobile/controllers/dashboardcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/launchscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/supportscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/Subscreens/usermanagement/usermanagementmainscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settingscreen extends StatelessWidget {
  Settingscreen({super.key});

  final Logincontroller logincontroller = Get.find<Logincontroller>();
  final Dashboardcontroller dashboardcontroller = Get.find<Dashboardcontroller>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Manage your account and preferences",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.to(() => Usermanagementmainscreen());
                  },
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.manage_accounts_outlined, color: Colors.blue[700]),
                  ),
                  title: Text(
                    "User Management",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: Text(
                    "Manage users and permissions",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[500]),
                ),
                Divider(height: 1, color: Colors.grey[200]),
                ListTile(
                  onTap: () {
                    Get.to(() => Supportscreen());
                  },
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.support, color: Colors.red[700]),
                  ),
                  title: Text(
                    "Support",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: Text(
                    "Get help and contact support",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[500]),
                ),
                Divider(height: 1, color: Colors.grey[200]),
                ListTile(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.logout, color: Colors.orange[700]),
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.grey[800],
                    ),
                  ),
                  subtitle: Text(
                    "Sign out of your account",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Version info or additional settings can go here
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              "Version 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.logout,
                size: 48,
                color: Colors.orange[700],
              ),
              const SizedBox(height: 16),
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Custombutton(
                      label: "Cancel",
                      onpressed: () {
                        Navigator.pop(ctx);
                      },
                
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Custombutton(
                      label: "Logout",
                      onpressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Launchscreen()),
                        );
                        logincontroller.accesstoken.value = '';
                        logincontroller.clearfield();
                        dashboardcontroller.selectedindex.value = 0;
                      },
                      
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}