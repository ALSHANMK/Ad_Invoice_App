import 'package:ad_invoice_mobile/ui/screens/auth/loginscreen.dart';
import 'package:flutter/material.dart';

class Messagescreen extends StatelessWidget {
  const Messagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body:Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/finance.jpg",fit: BoxFit.fill,)),
          Container(
            child: Column(
              children: [
                SizedBox(height: 150,),
                Row(
                  children: [
                    SizedBox(width: 40,),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(image: AssetImage("asset/")),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 169, 205, 230),
                            blurRadius: 3,
                          )
                        ]
                       
                        
                      ),
                      child: Text("Thank you,our team will reach out to you soon",style: 
                              TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: const Color.fromARGB(255, 15, 13, 13)),
                              ),
                    ),
                  ],
                ),
            GestureDetector(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()),
              );
            },
            child: Text("Go back to login page",style: TextStyle(color: Colors.blue),),
            )
          
            
              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.transparent,
        child: Center(child: Text("© 2025 ADSTRA DIGITAL",style: TextStyle(color: Color.fromARGB(255, 43, 40, 40),),)),

      ),
    );
  }
}