import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductServicefulldetails extends StatelessWidget {
  ProductServicefulldetails({super.key});

  final products = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final bool isService = products['type'] == 'service';
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isService ? "Service Details" : "Product Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: isService ? Colors.orange[700] : Colors.blue[700],
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeaderSection(isService),
            SizedBox(height: 24),
            
            // Pricing Information
            _buildSectionTitle("Pricing Information"),
            _buildInfoCard(
              children: [
                _buildInfoRow(
                  Icons.attach_money, 
                  "Price", 
                  "₹${products['price'] ?? '0.00'}"
                ),
                if (!isService)
                  _buildInfoRow(
                    Icons.inventory, 
                    "Stock Quantity", 
                    "${products['stock_quantity'] ?? 0}"
                  ),
                if (isService)
                  _buildInfoRow(
                    Icons.people, 
                    "Workers", 
                    "${products['stock_quantity'] ?? 0}"
                  ),
              ],
            ),
            SizedBox(height: 20),
            
            // Description Section
            if (products['description'] != null && products['description'].isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Description"),
                  _buildInfoCard(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          products['description'] ?? 'No description available',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            
            // Status Information
            _buildSectionTitle("Status Information"),
            _buildInfoCard(
              children: [
                _buildStatusRow(
                  "Status", 
                  products['is_active'] == true ? "Active" : "Inactive",
                  isActive: products['is_active'] == true
                ),
                _buildStatusRow(
                  "Delivery", 
                  products['delivery_available'] == true ? "Available" : "Not Available",
                  isActive: products['delivery_available'] == true
                ),
                _buildInfoRow(
                  Icons.category, 
                  "Type", 
                  isService ? "Service" : "Product"
                ),
                if (products['category'] != null && products['category'].isNotEmpty)
                  _buildInfoRow(
                    Icons.label, 
                    "Category", 
                    products['category']
                  ),
              ],
            ),
            
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 120,
                child: Custombutton(
                  label: "Back",
                  onpressed: () {
                    Get.back();
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isService) {
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
            colors: isService 
                ? [Colors.orange[50]!, Colors.orange[100]!]
                : [Colors.blue[50]!, Colors.blue[100]!],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: isService ? Colors.orange[700] : Colors.blue[700],
              child: Icon(
                isService ? Icons.build : Icons.shopping_bag,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            Text(
              products['name'] ?? "No Name Provided",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: isService ? Colors.orange[100] : Colors.blue[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isService ? Colors.orange[300]! : Colors.blue[300]!,
                ),
              ),
              child: Text(
                isService ? "SERVICE" : "PRODUCT",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isService ? Colors.orange[800] : Colors.blue[800],
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

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[600],
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

  Widget _buildStatusRow(String label, String value, {required bool isActive}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isActive ? Icons.check_circle : Icons.cancel,
            size: 20,
            color: isActive ? Colors.green : Colors.red,
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
                    color: isActive ? Colors.green[700] : Colors.red[700],
                    fontWeight: FontWeight.w500,
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