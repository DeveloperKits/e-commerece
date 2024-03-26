import 'package:ecommerece/pages/category.dart';
import 'package:ecommerece/pages/dashboard_page.dart';
import 'package:ecommerece/pages/login_page.dart';
import 'package:ecommerece/pages/luncher_page.dart';
import 'package:ecommerece/pages/new_products.dart';
import 'package:ecommerece/pages/view_products.dart';
import 'package:ecommerece/providers/products_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (context) => const LauncherPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        DashBoardPage.routeName: (context) => const DashBoardPage(),
        NewProductsPage.routeName: (context) => const NewProductsPage(),
        ViewProductPage.routeName: (context) => const ViewProductPage(),
        CategoryPage.routeName: (context) => const CategoryPage(),
      },
    );
  }
}
