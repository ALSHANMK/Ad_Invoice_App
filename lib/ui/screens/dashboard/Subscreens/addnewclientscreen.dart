import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Addnewclientscreen extends StatelessWidget {
  const Addnewclientscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Client"),
        backgroundColor: const Color.fromARGB(255, 150, 194, 230),
      ),
      body: Column(
        
        children: [
            Container(
              height: screenheight/2*1.2,
              width: screenwidth,
              child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Client name"),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Company name"),
            ),
          ),
          SizedBox(height: 20,),
          
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Mobile"),
            ),
          ),
           SizedBox(height: 20,),
           TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Phone"),
            ),
          ),
           SizedBox(height: 20,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Email"),
            ),
          ),
           SizedBox(height: 20,),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text("Address"),
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
            ),
            SizedBox(height: 15,),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(label: "Discard", onpressed: (){}),
                SizedBox(width: 20,),
                Custombutton(label: "Save", onpressed: (){}),
              ],
            )
        ],
      )
      
    );
  }
}