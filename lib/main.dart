import 'package:flutter/material.dart';
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/screens/updateProductScreen.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProductScreen.id : (context) => UpdateProductScreen()
      },
      initialRoute: HomePage.id,
    );
  }
}
