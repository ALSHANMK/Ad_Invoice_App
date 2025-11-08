import 'package:ad_invoice_mobile/controllers/apicontrollers/registrationcontroller.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/forgotscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/loginscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/customforfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;

class Registerscreen extends StatelessWidget {
 const Registerscreen({super.key});

  

  @override
  Widget build(BuildContext context) {


    Registrationcontroller registrationcontroller=Get.put(Registrationcontroller());
    final bool isMobile = responsive.ResponsiveBreakpoints.of(context).smallerThan(responsive.TABLET);

    Widget registerForm = Column(
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
          "Greetings, we are excited for a new partnership",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 14 : 18,
          ),
        ),

        const SizedBox(height: 30),

        
        Text(
          "Register",
          style: TextStyle(
            color: Colors.grey,
            fontSize: isMobile ? 18 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        
        TextField(
          controller: registrationcontroller.firstnamecontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter you first name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: registrationcontroller.lastnamecontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter you Last name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: registrationcontroller.emailcontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter you Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: registrationcontroller.phonecontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter you Phone",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: registrationcontroller.addresscontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter you Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          onTap: ()=>registrationcontroller.pickdate(),
          controller: registrationcontroller.dobcontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            
            hintText: "Enter Dob",
            suffixIcon: Icon(Icons.calendar_month,color: Colors.blue,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
       
        const SizedBox(height: 10),
        TextField(
          controller: registrationcontroller.companycontroller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter you Company name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),
        ),
        const SizedBox(height: 40),

       
        SizedBox(
          width: double.infinity,
          child: Custombutton(
            label: "Next",
            onpressed: () {
             registrationcontroller.isunderage.value?Get.snackbar("Could not register", "You are under 18",icon: Icon(Icons.error),backgroundColor: Colors.red[300]): registrationcontroller.register();
            },
          ),
        ),
        Obx(()=>registrationcontroller.isloading.value?CircularProgressIndicator():SizedBox.shrink()),
        

        const SizedBox(height: 20),

       
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
          },
          child: const Text(
            "Already have an account?",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              "assets/finance.jpg",
              fit: BoxFit.fill,
            ),
          ),

         
          Align(
            alignment: const Alignment(0, -0.7),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: isMobile
                  ? registerForm
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
                            child: registerForm,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 50,
        color: Colors.transparent,
        child: Center(
          child: Text(
            "© 2025 ADSTRA DIGITAL",
            style: TextStyle(
              color: const Color.fromARGB(255, 43, 40, 40),
              fontSize: isMobile ? 12 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
