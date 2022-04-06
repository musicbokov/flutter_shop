import 'package:flutter/material.dart';
import 'package:flutter_shop/l10n/l10n.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final List products = [
      {'name': 'product 1'},
      {'name': 'product 2'},
      {'name': 'product 3'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
      {'name': 'product 4'},
    ];

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(l10n.catalog,
              style: const TextStyle(fontSize: 18)
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(ProductsOverviewPage.route());
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child:Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(products[index]['name'], style: const TextStyle(fontWeight: FontWeight.bold),),
                          const Text('80 шт.'),
                        ],
                      )
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
