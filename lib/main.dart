import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:str/models/cart.dart';
import 'package:str/models/orders_list.dart';
import 'package:str/models/product_list.dart';
import 'package:str/pages/cart_page.dart';
import 'package:str/pages/counter_page.dart';
import 'package:str/pages/orders_page.dart';
import 'package:str/pages/product_detail_page.dart';
import 'package:str/pages/product_form_page.dart';
import 'package:str/pages/products_overview_page.dart';
import 'package:str/pages/products_page.dart';
import 'package:str/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrderList()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => ProductsOverviewPage(),
          AppRoutes.productDetails: (ctx) => ProductDetailPage(),
          AppRoutes.cart: (ctx) => CartPage(),
          AppRoutes.orders: (ctx) => OrderPage(),
          AppRoutes.products: (ctx) => ProductsPage(),
          AppRoutes.productForm: (ctx) => ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
