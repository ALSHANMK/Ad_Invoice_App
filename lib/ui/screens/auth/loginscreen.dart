import 'package:ad_invoice_mobile/controllers/apicontrollers/logincontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/forgotscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/registerscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/customforfield.dart';

import 'package:ad_invoice_mobile/ui/screens/dashboard/dashboardmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Logincontroller logincontroller=Get.put(Logincontroller());
    final bool isMobile = responsive.ResponsiveBreakpoints.of(context).smallerThan(responsive.TABLET);

    Widget loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        Image.asset(
          'assets/logo.png',
          width: isMobile ? 120 : 180,
          height: 150,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 10),

        
        Text(
          "Welcome back business partner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.grey[300],
            fontSize: isMobile ? 14 : 18,
          ),
        ),

        const SizedBox(height: 30),

       
        Text(
          "Login",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 18 : 22,
          ),
        ),

        const SizedBox(height: 20),

      
        TextField(
          controller: logincontroller.usernamecontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Username",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20)
            )
          ),
        ),

        const SizedBox(height: 20),

      
        TextField(
          controller: logincontroller.passwordcontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "password",
            border: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(20)
            )
          ),
        ),

        const SizedBox(height: 40),

        
        Custombutton(label: "Signin", onpressed: ()async{
          
            await logincontroller.login();
          if(logincontroller.accesstoken.value.isNotEmpty)
          {
             Get.to(()=>Dashboardmain());
          }
  
        }),
        Obx(()=>logincontroller.isloading.value?CircularProgressIndicator():SizedBox.shrink()),
        const SizedBox(height: 15),

        
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Forgotscreen()),
            );
          },
          child: const Text(
            "Forgot Username or Password?",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),

        const SizedBox(height: 10),

        
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Registerscreen()),
            );
          },
          child: const Text(
            "New here? Create new account",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
       
          Positioned.fill(
            child: Image.asset(
              "assets/background.jpeg",
              fit: BoxFit.fill,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),

        
          Align(
            alignment: const Alignment(0, -0.7),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: isMobile
                  ? loginForm
                  : Center(
                      child: Card(
                        color: Colors.black.withOpacity(0.5),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: SizedBox(
                            width: responsive.ResponsiveValue<double>(
                              context,
                              defaultValue: MediaQuery.of(context).size.width * 0.8,
                              conditionalValues: [
                                responsive.Condition.smallerThan(name: responsive.TABLET, value: MediaQuery.of(context).size.width * 0.9),
                                responsive.Condition.largerThan(name: responsive.DESKTOP, value: 600),
                              ],
                            ).value,
                            child: loginForm,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),

      
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
        child: const Center(
          child: Text(
            "© 2025 ADSTRA DIGITAL",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
