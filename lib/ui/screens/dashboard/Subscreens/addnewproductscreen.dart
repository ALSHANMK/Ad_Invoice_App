import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class Addnewproductscreen extends StatelessWidget {
  const Addnewproductscreen({super.key});

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
          Text("Add your products details here",style: TextStyle(fontWeight: FontWeight.bold),),
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
                    label: Text("Product Name"),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    label: Text("Quantity"),
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
                    label: Text("Tax"),
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