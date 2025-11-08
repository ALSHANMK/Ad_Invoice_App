import 'package:ad_invoice_mobile/controllers/apicontrollers/notificationandsupportcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Supportscreen extends StatelessWidget {
  const Supportscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final TextEditingController subjectcontroller = TextEditingController();
    final TextEditingController descriptioncontroller = TextEditingController();
    final Notificationandsupportcontroller notificationcontroller = Get.find<Notificationandsupportcontroller>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Support",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get Help & Support",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Describe your issue and we'll get back to you as soon as possible",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              "Subject *",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: screenheight * 0.08,
              width: double.infinity,
              child: TextField(
                controller: subjectcontroller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Enter a brief subject for your issue...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[700]!),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Description *",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: screenheight * 0.25,
              width: double.infinity,
              child: TextField(
                controller: descriptioncontroller,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Describe your issue in detail...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue[700]!),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  contentPadding: EdgeInsets.all(16.0),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 200,
                child: Custombutton(
                  label: "Submit Ticket",
                  onpressed: () async {
                    if (subjectcontroller.text.isEmpty || descriptioncontroller.text.isEmpty) {
                      Get.snackbar(
                        "Required Fields",
                        "Please fill in both subject and description",
                        backgroundColor: Colors.orange[700],
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: EdgeInsets.all(16),
                      );
                    } else {
                      await notificationcontroller.submitsupo(
                        subjectcontroller.text, 
                        descriptioncontroller.text
                      );
                      subjectcontroller.clear();
                      descriptioncontroller.clear();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[100]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue[700],
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Support Information",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Our support team typically responds within 24 hours. For urgent matters, please include 'URGENT' in your subject line.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}