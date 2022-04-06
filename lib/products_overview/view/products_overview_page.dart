import 'package:flutter/material.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';
import 'package:flutter_shop/products_overview/view/products_overview_view.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);
  static Route<void> route() {
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => ProductsOverviewPage()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Бакалея'),
          automaticallyImplyLeading: false,
        ),
        body: ProductsOverviewView(),
    );
  }
}
