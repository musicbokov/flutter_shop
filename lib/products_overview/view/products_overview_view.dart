import 'package:flutter/material.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';

class ProductsOverviewView extends StatelessWidget {
  const ProductsOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List products = [
      {'name': 'Чай', 'price': '140 P', 'estimate': '4.7', 'image': 'assets/tea.png'},
      {'name': 'Сахар', 'price': '60 Р', 'estimate': '5.0', 'image': 'assets/sugar.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
      {'name': 'Кофе', 'price': '150 P', 'estimate': '3.2', 'image': 'assets/coffee.png'},
    ];
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, index) {
        return ProductItem(
          products[index]['name'],
          products[index]['estimate'],
          products[index]['image'],
          products[index]['price'],
        );
      },
    );
  }
}
