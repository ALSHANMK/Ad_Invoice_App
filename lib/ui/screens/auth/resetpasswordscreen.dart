import 'package:ad_invoice_mobile/ui/screens/auth/loginscreen.dart';
import 'package:flutter/material.dart';

class Resetpasswordscreen extends StatelessWidget {
  const Resetpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset('assets/logo.jpg',
              width: 70,
              height: 50,
              ),
            ),
            SizedBox(height: 100,),
            Center(
              child: Text("Reset password",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.grey,
              ),
              ),
            ),
            
            Text("Set new password",style: TextStyle(fontStyle: FontStyle.italic),),
            SizedBox(height: 20,),
                TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter new password",
                          filled: true,
                          fillColor: Colors.grey[350],
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),)
                        ),
                      ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    hintText: "Confirm new password",
                    filled: true,
                    fillColor: Colors.grey[350],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()),);
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800]), 
                child: Text("Submit",style: TextStyle(color: Colors.white),),
                ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.transparent,
        child: Center(
          child: Text("© 2025 ADSTRA DIGITAL",style: TextStyle(color: Color.fromARGB(255, 43, 40, 40),
          ),
          ),
        ),
      ),
    );
    
  }
}