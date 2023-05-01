import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:str/models/product.dart';
import 'package:str/models/product_list.dart';
import 'package:str/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.productForm,
                  arguments: product,
                );
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir Produto'),
                      content: Text('Tem certeza?'),
                      actions: [
                        TextButton(
                          child: Text('Não'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                            child: Text('Sim'),
                            onPressed: () {
                              Provider.of<ProductList>(context, listen: false)
                                  .removeProduct(product);
                              Navigator.of(ctx).pop();
                            }),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error),
          ],
        ),
      ),
    );
  }
}
