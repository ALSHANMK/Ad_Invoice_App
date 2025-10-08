import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Addnewservicescreen extends StatelessWidget {
  const Addnewservicescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Add new item"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Add your Service details here",style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            height: screenheight/2*1.2,
            child: ListView(
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    label: Text("Service"),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    label: Text("....."),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    label: Text("Price"),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    label: Text("Service Tax"),
                  ),
                ),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombutton(label: "Discard", onpressed: (){}),
                    SizedBox(width: 10,),
                    Custombutton(label: "Save", onpressed: (){

                })
                  ],
                ),
                
                
              ],
            ),
          )
        ],
      ),
    );
  }
}