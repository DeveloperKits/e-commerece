import 'dart:io';

import 'package:ecommerece/model/category_model.dart';
import 'package:ecommerece/providers/products_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class NewProductsPage extends StatefulWidget {
  static const String routeName = "/newproduct";

  const NewProductsPage({super.key});

  @override
  State<NewProductsPage> createState() => _NewProductsPageState();
}

class _NewProductsPageState extends State<NewProductsPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final key = GlobalKey<FormState>();
  CategoryModel? categoryModel;
  String? localImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Products"),
        actions: [
          IconButton(
            onPressed: _saveData,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: key,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _imageSection(),
            const SizedBox(
              height: 20,
            ),
            _categorySection(),
            const SizedBox(
              height: 10,
            ),
            _formSection(),
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            localImagePath == null
                ? const Icon(
                    Icons.person,
                    size: 150,
                  )
                : Image.file(File(localImagePath!),
                    width: 150, height: 150, fit: BoxFit.fill),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _getProductsImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_album),
                  label: const Text("Gallery"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _categorySection() {
    return Card(
      child: Consumer<ProductsProvider>(
        builder: (context, provider, child) => DropdownButtonFormField<CategoryModel>(
          items: provider.categoryList
              .map((category) =>
                  DropdownMenuItem(value: category, child: Text(category.name)))
              .toList(),
          onChanged: (value) {
            setState(() {
              categoryModel = value;
            });
          },
          value: categoryModel,
          hint: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text("Select Category"),
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value == null) {
              return "Please enter product quantity";
            }
            return null;
          },

        ),
      ),
    );
  }

  Widget _formSection() {
    return Column(
      children: [
        // name input text field
        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            labelText: "Product Name*",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter product name";
            }
            return null;
          },
        ),

        const SizedBox(
          height: 10,
        ),

        // description input text field
        TextFormField(
          controller: descriptionController,
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            labelText: "Product Description(optional)",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            return null;
          },
        ),

        const SizedBox(
          height: 10,
        ),

        // price input text field
        TextFormField(
          controller: priceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: "Product Price",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter product price";
            }
            return null;
          },
        ),

        const SizedBox(
          height: 10,
        ),

        // name input text field
        TextFormField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Product Quantity",
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter product quantity";
            }
            return null;
          },
        ),
      ],
    );
  }

  void _saveData() async {
    if (localImagePath == null) {

    }

    if(key.currentState!.validate()){
      final name = nameController.text;
      final description = descriptionController.text;
      final price = priceController.text;
      final quantity = quantityController.text;

      EasyLoading.show(status: "Saving...");

      try{
        //final downloadUrl = await context.read<ProductsProvider>().uploadImage(localImagePath!);
      }catch(e){
        print(e.toString());
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void _getProductsImage(camera) async {
    final xFile = await ImagePicker().pickImage(source: camera, imageQuality: 50);
    if(xFile != null) {
      setState(() {
        localImagePath = xFile.path;
      });
    }
  }
}
