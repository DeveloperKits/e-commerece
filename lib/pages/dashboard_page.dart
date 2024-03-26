import 'package:ecommerece/auth/auth_service.dart';
import 'package:ecommerece/custom_widgets/dashboard_item_view.dart';
import 'package:ecommerece/model/dashboard_item.dart';
import 'package:ecommerece/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DashBoardPage extends StatelessWidget {
  static const String routeName = "/dashboard";

  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        actions: [
          IconButton(
              onPressed: () {
                AuthService.logout().then((value) {
                  EasyLoading.showSuccess("Logout Successfully");
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                });
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: dashboardItemList.length,
          itemBuilder: (context, index){
            final item = dashboardItemList[index];
            return DashboardItemView(item: item,);
          },
        ),
      ),
    );
  }
}
