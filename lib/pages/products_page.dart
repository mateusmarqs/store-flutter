import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:str/models/product_list.dart';
import 'package:str/widgets/app_drawer.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList prodocts = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerencar Produtos'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (ctx, i) => Text(prodocts.items[i].name),
        ),
      ),
    );
  }
}
