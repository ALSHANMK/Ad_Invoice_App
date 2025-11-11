import 'package:ad_invoice_mobile/controllers/apicontrollers/getproposalcontroller.dart';
import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/emergency_invoice.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/receipt/receiptsecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Receiptfirstscreen extends StatelessWidget {
  const Receiptfirstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final Userscontroller userscontroller = Get.find<Userscontroller>();
    final TextEditingController searchcontroller = TextEditingController();
    final Getproposalcontroller getproposalcontroller = Get.find<Getproposalcontroller>();
    final Dropdowncontroller dropdowncontroller = Get.find<Dropdowncontroller>();

    List<dynamic> getFilteredInvoices() {
      final selectedIndex = userscontroller.selecteduser.value;
      if (selectedIndex == -1) return [];
      
      final selectedClient = userscontroller.filteredusers[selectedIndex];
      final clientName = selectedClient['name'];
      
      return getproposalcontroller.invoice.where((invoi) {
        return invoi['client_name'] == clientName;
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Create Receipt",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Section
          Card(
            elevation: 2,
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchcontroller,
                      onChanged: (value) => userscontroller.filtering(value),
                      decoration: InputDecoration(
                        hintText: "Search client...",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  ElevatedButton.icon(
                    icon: Icon(Icons.emergency, color: Colors.red, size: 20),
                    onPressed: () => Get.to(() => EmergencyInvoice()),
                    label: Text("Emergency"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      side: BorderSide(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),

          // Clients List
          Expanded(
            flex: 2,
            child: Obx(() {
              final hassearch = searchcontroller.text.isNotEmpty;
              final hasclient = userscontroller.filteredusers.isNotEmpty;
              
              if (!hassearch) {
                return Center(
                  child: Text(
                    "Search clients above",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                );
              }
              
              if (!hasclient) {
                return Center(
                  child: Text(
                    "No clients found",
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                );
              }

              return ListView.builder(
                itemCount: userscontroller.filteredusers.length,
                itemBuilder: (context, index) {
                  final client = userscontroller.filteredusers[index];
                  
                  return Obx(() {
                    final isselected = userscontroller.selecteduser.value == index;
                    
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      color: isselected ? Colors.blue[50] : Colors.white,
                      child: ListTile(
                        onTap: () async {
                          try {
    
                              userscontroller.selection(index);

                              //only fetch if user is newly selected
                              if (userscontroller.selecteduser.value == index) {
                                await getproposalcontroller.getinvo();
                              } else {
                                //clear proposals when deselected
                                getproposalcontroller.invoice.clear();
                                final dropdowncontroller = Get.find<Dropdowncontroller>();
                                dropdowncontroller.selectedvalue.value = null;
                              }
                            } catch (e) {
                              Get.snackbar("Error", "Failed to load proposals");
                            }
                        },
                        leading: Icon(
                          Icons.person,
                          color: isselected ? Colors.blue[700] : Colors.grey,
                        ),
                        title: Text(
                          client['name'] ?? 'Unnamed Client',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isselected ? Colors.blue[700] : Colors.black,
                          ),
                        ),
                        subtitle: Text(client['location'] ?? ''),
                        trailing: Icon(
                          isselected ? Icons.check_circle : Icons.radio_button_unchecked,
                          color: isselected ? Colors.green : Colors.grey,
                        ),
                      ),
                    );
                  });
                },
              );
            }),
          ),

          SizedBox(height: 10),

          // Invoices Dropdown
          Obx(() => Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                dropdownColor: Colors.grey[100],
                icon: Icon(Icons.arrow_drop_down),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: "Select Invoice",
                ),
                hint: Text("Choose an invoice"),
                value: dropdowncontroller.selectedvalue.value,
                onChanged: dropdowncontroller.changedvalue,
                items: getFilteredInvoices().isEmpty 
    ? [DropdownMenuItem(value: null, child: Text("No invoices available"))]
    : getFilteredInvoices().map<DropdownMenuItem<String>>((invoice) {
        return DropdownMenuItem<String>(
          value: invoice['id']?.toString(),
          child: Container(
            constraints: BoxConstraints(maxWidth: screenwidth * 0.6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${invoice['invoice_number']}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Due: ${invoice['due_date']}",
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }).toList(),
              ),
            ),
          )),

          SizedBox(height: 20),

          // Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Custombutton(
                    label: "Cancel", 
                    onpressed: () {
                       getproposalcontroller.invoice.clear();
                                final dropdowncontroller = Get.find<Dropdowncontroller>();
                                dropdowncontroller.selectedvalue.value = null;
                                Get.back();
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Custombutton(
                    label: "Next", 
                    onpressed: () async {
                      final selectedid = dropdowncontroller.selectedvalue.value;
                      
                      if (selectedid == null || selectedid.isEmpty) {
                        Get.snackbar("Error", "Please select an invoice");
                        return;
                      }

                      try {
                        final items = await getproposalcontroller.getinvodetails(selectedid);
                        Get.to(() => Receiptsecondscreen(), arguments: {
                          'items': items,
                        });
                      } catch (e) {
                        Get.snackbar("Error", "Failed to load invoice details");
                      }
                    },
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