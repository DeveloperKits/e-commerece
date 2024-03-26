import 'package:ecommerece/providers/products_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const String routeName = "/category";
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: const Icon(Icons.add),
      ),
      
      body: Consumer<ProductsProvider>(
        builder: (context, provider, child) => provider.categoryList.isEmpty
        ? const Center(
          child: Text("No category found"),
        )

        : ListView.builder(
          itemCount: provider.categoryList.length,
          itemBuilder: (context, index) {
            final category = provider.categoryList[index];
            return ListTile(
              title: Text(category.name),
            );

          },
        ),
      ),
    );
  }
}
