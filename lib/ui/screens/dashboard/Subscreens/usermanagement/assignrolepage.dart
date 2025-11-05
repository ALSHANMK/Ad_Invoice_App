import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Assignrolepage extends StatelessWidget {
  const Assignrolepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assign Role"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
                              validator: (value) {
                                if(value==null || value.isEmpty)
                                {
                                  return "This field is required";
                                }
                                return null;
                              },
                             
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: Text("Designation"),
                  ),
                            ),
        
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: DropdownButtonFormField(
                  
                  elevation: 6,
                   value: "option1", 
                   items: [
                     DropdownMenuItem(value: "option1", child: Text("Priv 1")),
                     DropdownMenuItem(value: "option2", child: Text("Priv 2")),
                     DropdownMenuItem(value: "option3", child: Text("Priv 3")),
                   ],
                   onChanged: null, 
                   decoration: InputDecoration(
                    hint: Text("Select permissions"),
                    prefixIcon: Icon(Icons.admin_panel_settings),
                     labelText: "Priviledges",
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                     filled: true,
                     fillColor: Colors.grey[100],
                     
                   ),
                 ),
               ),
             ),
             Custombutton(label: "Save", onpressed: (){}),
        
            
          ],
        ),
      ),
    );
  }
}