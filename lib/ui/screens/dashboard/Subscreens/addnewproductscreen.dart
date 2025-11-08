import 'package:ad_invoice_mobile/controllers/apicontrollers/addproductcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addnewproductscreen extends StatelessWidget {
  const Addnewproductscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final Addproductcontroller addproductcontroller = Get.put(Addproductcontroller());
    final Productlistcontroller productlistcontroller = Get.find<Productlistcontroller>();

    void submitform() {
      if (formkey.currentState!.validate()) {
        // Form is valid
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(
          "Add New Product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Fill in the product information below",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 24),
                    _buildTextFormField(
                      controller: addproductcontroller.typecontroller,
                      label: "Product Type *",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide product type";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: addproductcontroller.categorycontroller,
                      label: "Category *",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter category";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: addproductcontroller.namecontroller,
                      label: "Product Name *",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter product name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: addproductcontroller.descriptioncontroller,
                      label: "Description",
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFormField(
                            controller: addproductcontroller.pricecontroller,
                            label: "Price *",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Price is required";
                              }
                              if (double.tryParse(value) == null) {
                                return "Please enter a valid price";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: addproductcontroller.stockquantity,
                            label: "Quantity *",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Quantity is required";
                              }
                              if (double.tryParse(value) == null) {
                                return "Please enter a valid quantity";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Product Status",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 12),
                    Obx(() => Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: addproductcontroller.isactive.value,
                                onChanged: (value) => addproductcontroller.isactive.value = value!,
                                activeColor: Colors.blue[700],
                              ),
                              Text(
                                'Active Product',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: addproductcontroller.deliveryavail.value,
                                onChanged: (value) => addproductcontroller.deliveryavail.value = value!,
                                activeColor: Colors.blue[700],
                              ),
                              Text(
                                'Delivery Available',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 40), // Extra space for bottom buttons
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Custombutton(
                      label: "Discard",
                      onpressed: () {
                        Get.back();
                      },
                      
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Custombutton(
                      label: "Save Product",
                      onpressed: () async {
                        if (!formkey.currentState!.validate()) {
                          Get.snackbar(
                            "Validation Error",
                            "Please fill all required fields",
                            backgroundColor: Colors.orange[700],
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }
                        try {
                          await addproductcontroller.additem();
                          if (addproductcontroller.isSuccess.value) {
                            await productlistcontroller.getpro();
                            addproductcontroller.clearfield();
                            Get.snackbar(
                              "Success",
                              "Product added successfully",
                              backgroundColor: Colors.green[400],
                              colorText: Colors.white,
                            );
                            Get.back();
                          } else {
                            Get.snackbar(
                              "Error",
                              "Failed to add product. Please check the information.",
                              backgroundColor: Colors.red[400],
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                            "Error",
                            "An error occurred: $e",
                            backgroundColor: Colors.red[400],
                            colorText: Colors.white,
                          );
                        }
                      },
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

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
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
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        alignLabelWithHint: maxLines > 1,
      ),
    );
  }
}