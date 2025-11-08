import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Clientfulldetails extends StatelessWidget {
  Clientfulldetails({super.key});

  final client = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Client Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(),
            SizedBox(height: 24),
            
            // Contact Information
            _buildSectionTitle("Contact Information"),
            _buildInfoCard(
              children: [
                _buildInfoRow(Icons.email, "Email", client["email"]),
                _buildInfoRow(Icons.phone, "Phone", client["phone"]),
              ],
            ),
            SizedBox(height: 20),
            
            // Business Information
            _buildSectionTitle("Business Information"),
            _buildInfoCard(
              children: [
                _buildInfoRow(Icons.business, "Industry", client["industry"]),
                _buildInfoRow(Icons.badge, "Tax ID", client["tax_id"]),
                _buildInfoRow(Icons.numbers, "Registration Number", client["registration_number"]),
              ],
            ),
            SizedBox(height: 20),
            
            // Address Information
            _buildSectionTitle("Address Information"),
            _buildInfoCard(
              children: [
                if (client["address_line1"] != null && client["address_line1"].isNotEmpty)
                  _buildInfoRow(Icons.location_on, "Address Line 1", client["address_line1"]),
                if (client["address_line2"] != null && client["address_line2"].isNotEmpty)
                  _buildInfoRow(Icons.location_on, "Address Line 2", client["address_line2"]),
                if (client["city"] != null || client["state"] != null)
                  _buildInfoRow(
                    Icons.location_city, 
                    "City/State", 
                    "${client["city"] ?? ''}${client["city"] != null && client["state"] != null ? ', ' : ''}${client["state"] ?? ''}"
                  ),
                _buildInfoRow(Icons.public, "Country", client["country"]),
                if (client["postal_code"] != null && client["postal_code"].isNotEmpty)
                  _buildInfoRow(Icons.markunread_mailbox, "Postal Code", client["postal_code"]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue[50]!, Colors.blue[100]!],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue[700],
              child: Text(
                client["name"] != null && client["name"].isNotEmpty 
                    ? client["name"][0].toUpperCase() 
                    : "C",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              client["name"] ?? "No Name Provided",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            if (client["industry"] != null && client["industry"].isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  client["industry"],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: children,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String? value) {
    if (value == null || value.isEmpty) {
      return SizedBox(); // Don't show empty fields
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.blue[700],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}