import 'package:flutter/material.dart';

class Generalscreen extends StatelessWidget {
  const Generalscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: Text("General",style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 94, 83, 83)),),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: screenheight/3*1.2,
            child: ListView(
              children: [
                Text("Application"),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.verified_user_outlined),
                  title: Text("App Language",textAlign: TextAlign.center,),
                  tileColor: Colors.grey[350],
                ),
                SizedBox(height: 5,),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.currency_rupee_sharp),
                  title: Text("Business Currency",textAlign: TextAlign.center,),
                   tileColor: Colors.grey[350],
                ),
                SizedBox(height: 5,),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.theater_comedy_outlined),
                  title: Text("Theme",textAlign: TextAlign.center,),
                   tileColor: Colors.grey[350],
                ),
                SizedBox(height: 5,),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.delete,color: Colors.red,),
                  title: Text("Delete Account",textAlign: TextAlign.center,),
                   tileColor: Colors.grey[350],
                ),
                
              ],
            ),
          ),
          
          SizedBox(
            height: screenheight/3,
            child: ListView(
              children: [
                Text("Security"),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.password_rounded),
                  title: Text("Change password",textAlign: TextAlign.center,),
                  tileColor: Colors.grey[350],
                ),
                SizedBox(height: 5,),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.backup),
                  title: Text("Backup Data",textAlign: TextAlign.center,),
                   tileColor: Colors.grey[350],
                ),
                SizedBox(height: 5,),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.mobile_friendly_outlined),
                  title: Text("Verify Number",textAlign: TextAlign.center,),
                   tileColor: Colors.grey[350],
                ),
                SizedBox(height: 5,),
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                  leading: Icon(Icons.delete,color: Colors.red,),
                  title: Text("Delete Transactions",textAlign: TextAlign.center,),
                   tileColor: Colors.grey[350],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}