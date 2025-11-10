import 'package:ad_invoice_mobile/controllers/apicontrollers/getproposalcontroller.dart';
import 'package:ad_invoice_mobile/controllers/dropdowncontroller.dart';
import 'package:ad_invoice_mobile/controllers/userscontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/emergency_invoice.dart';
import 'package:ad_invoice_mobile/ui/screens/dashboard/RIP/invoice/invoicesecondscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Invoicefirstscreen extends StatelessWidget {
  const Invoicefirstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Dropdowncontroller dropdowncontroller = Get.put(Dropdowncontroller());
    final Userscontroller userscontroller = Get.find<Userscontroller>();
    final TextEditingController searchcontroller = TextEditingController();
    final Getproposalcontroller getproposalcontroller = Get.put(Getproposalcontroller());

    final screenwidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Invoice"),
        backgroundColor: Colors.blue[700],
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
                  final userid = client['id'];
                  print(userid);
                  
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
                            await getproposalcontroller.getprop(userid);
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

          // Proposals Dropdown
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
                  labelText: "Select Proposal",
                ),
                hint: Text("Choose a proposal"),
                value: dropdowncontroller.selectedvalue.value,
                onChanged: dropdowncontroller.changedvalue,
                items: getproposalcontroller.proposal.isEmpty 
                    ? [DropdownMenuItem(value: null, child: Text("No proposals available"))]
                    : getproposalcontroller.proposal.map<DropdownMenuItem<String>>((proposalItem) {
                        return DropdownMenuItem<String>(
                          value: proposalItem['id']?.toString(),
                          child: Text(
                            "${proposalItem['proposal_number']} - ${proposalItem['title']}",
                            style: TextStyle(fontSize: 14),
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
                    onpressed: () => Get.back(),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Custombutton(
                    label: "Next", 
                    onpressed: () async {
                      final selectedid = dropdowncontroller.selectedvalue.value;
                      final selectedindex = userscontroller.selecteduser.value;
                      
                      if (selectedid == null || selectedid.isEmpty) {
                        Get.snackbar("Error", "Please select a proposal");
                        return;
                      }
                      
                      if (selectedindex == -1) {
                        Get.snackbar("Error", "Please select a client");
                        return;
                      }

                      try {
                        final items = await getproposalcontroller.getpropitem(selectedid);
                        final selectedclient = userscontroller.filteredusers[selectedindex];
                        
                        Get.to(() => Invoicesecondscreen(), arguments: {
                          'items': items,
                          'clients': selectedclient,
                        });
                      } catch (e) {
                        Get.snackbar("Error", "Failed to load items");
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