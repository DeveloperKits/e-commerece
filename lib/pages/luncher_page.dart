import 'package:ecommerece/auth/auth_service.dart';
import 'package:ecommerece/pages/dashboard_page.dart';
import 'package:ecommerece/pages/login_page.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = "/launcher";
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), (){
      if(AuthService.currentUser != null){
        Navigator.pushReplacementNamed(context, DashBoardPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}


