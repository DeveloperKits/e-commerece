import 'package:ecommerece/auth/auth_service.dart';
import 'package:ecommerece/db/db_helper.dart';
import 'package:ecommerece/pages/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility)
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "This field is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40.0,),

                FilledButton(
                  onPressed: _loginAdmin,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                    fixedSize: MaterialStatePropertyAll<Size>(Size(300, 50)),
                  ),
                  child: const Text("Login as Admin"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }


  void _loginAdmin() async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passController.text;

      EasyLoading.show(status: 'login...');

      try{
        final isAdmin = await AuthService.loginAdmin(email, password);
        EasyLoading.dismiss();
        if(isAdmin) {
          EasyLoading.showSuccess('Great Success!');
          Navigator.pushReplacementNamed(context, DashBoardPage.routeName);
        }else{
          AuthService.logout();
          EasyLoading.showError('You are not a admin. Please use a valid email address');
        }
      } on FirebaseAuthException catch(error){
        EasyLoading.showError('${error.message}');
      }
    }
  }
}
