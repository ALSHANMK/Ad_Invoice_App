import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Usermanagementeditscreen extends StatelessWidget {
  const Usermanagementeditscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User"),
        backgroundColor: Colors.blue,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            SizedBox(height: 10,),
            TextField(
            
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                label: Text("Email")
                ),
            ),
            SizedBox(height: 10,),
            TextField(
           
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              label: Text("Role")
                ),
            ),
            SizedBox(height: 10,),

             Row(
               children: [
                 Checkbox(
                         value: true,
                        onChanged: (value) {
                          value=false;
                         },),
                         Text("Active?"),

                         
                         
               ],
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [  
             Custombutton(label: "Cancel", onpressed: (){}),
              SizedBox(width: 10,),
             Custombutton(label: "Save", onpressed: (){}),
              ],
             )
          
          ],
          
        ),
      ),
    );
  }
}