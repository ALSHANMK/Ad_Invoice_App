import 'package:ad_invoice_mobile/ui/screens/auth/forgotscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/registerscreen.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/custombutton.dart';
import 'package:ad_invoice_mobile/ui/screens/auth/widgets/customforfield.dart';

import 'package:ad_invoice_mobile/ui/screens/dashboard/dashboardmain.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    Widget loginForm = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Logo
        Image.asset(
          'assets/logo.png',
          width: isMobile ? 120 : 180,
          height: 150,
          fit: BoxFit.contain,
        ),

        const SizedBox(height: 10),

        /// Welcome Text
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

        /// Login Title
        Text(
          "Login",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 18 : 22,
          ),
        ),

        const SizedBox(height: 20),

        /// Username field
        const Customforfield(
          hinttext: "Username",
          prefixicon: Icons.supervised_user_circle,
        ),

        const SizedBox(height: 20),

        /// Password field
        const Customforfield(
          hinttext: "Password",
          prefixicon: Icons.lock,
        ),

        const SizedBox(height: 40),

        /// Signin button
        Custombutton(label: "Signin", onpressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Signed IN!")),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboardmain()));
        }),
        const SizedBox(height: 15),

        /// Forgot password link
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

        /// Register link
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Registerscreen()),
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
          /// Background image
          Positioned.fill(
            child: Image.asset(
              "assets/background.jpeg",
              fit: BoxFit.fill,
            ),
          ),

          /// Login Form (Mobile vs Tablet)
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
                            width: ResponsiveValue<double>(
                              context,
                              defaultValue: MediaQuery.of(context).size.width * 0.8,
                              conditionalValues: [
                                Condition.smallerThan(name: TABLET, value: MediaQuery.of(context).size.width * 0.9),
                                Condition.largerThan(name: DESKTOP, value: 600),
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

      /// Footer
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
