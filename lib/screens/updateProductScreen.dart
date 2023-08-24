import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/modules/widgets/productcard.dart';
import 'package:storeapp/services/update_product_service.dart';

import '../modules/widgets/customButton.dart';
import '../modules/widgets/customTextFeild.dart';

class UpdateProductScreen extends StatefulWidget {
    UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, desc,image,price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          title: Text('Update Product',
          style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                isOb: false,
                onChanged: (val){
                  productName = val;
                },
                hint: 'Product Name',
                label: 'Product Name',
                valid: '',
              ),
              SizedBox(height: 10,),
              CustomTextField(
                inputType: TextInputType.number,
                isOb: false,
                onChanged: (val){
                  price = val;
                },
                hint: 'Price',
                label: 'Price',
                valid: '',
              ),
              SizedBox(height: 10,),

              CustomTextField(
                isOb: false,
                onChanged: (val){
                  desc = val;
                },
                hint: 'Description',
                label: 'Description',
                valid: '',
              ),
              SizedBox(height: 10,),
              CustomTextField(
                isOb: false,
                onChanged: (val){
                  image = val;
                },
                hint: 'Image',
                label: 'Image',
                valid: '',
              ),
              SizedBox(height: 50,),
              CustomButton(
                onTap: ()async{
                  setState(() {
                    isLoading = true;
                  });
                  try {
                   await updateProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('success'))
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())));
                  }
                  setState(() {
                    isLoading = false;
                  });
                },

                text: 'Update',

              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
    await UpdateProductService().updateProduct(
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category, id: product.id);
  }
}
