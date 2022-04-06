import 'package:flutter_shop/cart/bloc/cart_bloc.dart';
import 'package:flutter_shop/cart/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/l10n/l10n.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.catalogAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return CartBloc();
          },
          child: const CartView(),
        ),
      ),
    );
  }
}
