import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/updateProductScreen.dart';

class ProductCard extends StatelessWidget {
    ProductCard({
    required this.product
  });
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductScreen.id,arguments: product);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4), //New
                blurRadius: 20.0,
                offset: Offset(0, 25))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.image,
                height: 90,
                width: 90,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                product.title,
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$ ${product.price.toString()}'),
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite,
                    color: Colors.red,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}