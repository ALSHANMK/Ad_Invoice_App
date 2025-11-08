import 'package:ad_invoice_mobile/controllers/apicontrollers/addproductcontroller.dart';
import 'package:ad_invoice_mobile/controllers/apicontrollers/productlistcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addnewservicescreen extends StatelessWidget {
  Addnewservicescreen({super.key});
  
  final _formkey = GlobalKey<FormState>();
  final Addproductcontroller addproductcontroller = Get.put(Addproductcontroller());
  final Productlistcontroller productlistcontroller = Get.find<Productlistcontroller>();

  void submitform() {
    if (_formkey.currentState!.validate()) {
      print("Form is valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(
          "Add New Service",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Service Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Fill in the service information below",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 24),
                    _buildTextFormField(
                      controller: addproductcontroller.typecontroller,
                      label: "Service Type *",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide service type";
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
                      label: "Service Name *",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter service name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    _buildTextFormField(
                      controller: addproductcontroller.descriptioncontroller,
                      label: "Service Description",
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextFormField(
                            controller: addproductcontroller.pricecontroller,
                            label: "Rate *",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Rate is required";
                              }
                              if (double.tryParse(value) == null) {
                                return "Please enter a valid rate";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildTextFormField(
                            controller: addproductcontroller.stockquantity,
                            label: "Workers *",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Number of workers is required";
                              }
                              if (double.tryParse(value) == null) {
                                return "Please enter a valid number";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Service Status",
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
                                'Active Service',
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
                    SizedBox(height: 40),
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
                      label: "Save Service",
                      onpressed: () async {
                        print("Button pressed");
                        if (!_formkey.currentState!.validate()) {
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
                              "Service added successfully",
                              backgroundColor: Colors.green[400],
                              colorText: Colors.white,
                            );
                            Get.back();
                          } else {
                            Get.snackbar(
                              "Error",
                              "Failed to add service. Please check the information.",
                              backgroundColor: Colors.red[400],
                              colorText: Colors.white,
                            );
                          }
                        } catch (e) {
                          Get.snackbar(
                            "Error",
                            "Something went wrong: $e",
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