import 'package:flutter/material.dart';
import 'package:flutter_shop/l10n/l10n.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(l10n.cart,
                  style: const TextStyle(fontSize: 18)
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            Text('1658 P',
                style: const TextStyle(fontSize: 18)
            )
          ],
        ),
        Expanded(
          child: ProductsOverviewView(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              print('pay');
            },
            child: Text(l10n.cartButtonPay),
          ),
        ),
      ],
    );
  }
}
