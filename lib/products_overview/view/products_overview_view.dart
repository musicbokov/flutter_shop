import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';

class ProductsOverviewView extends StatelessWidget {
  const ProductsOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsOverviewBloc, ProductsOverviewState>(
      builder: (context, state) {
        if (state.products.isEmpty) {
          if (state.status == ProductsOverviewStatus.loading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state.status != ProductsOverviewStatus.success) {
            return const SizedBox();
          } else {
            return Center(
              child: Text(
                'l10n.flightsOverviewEmptyText',
                style: Theme.of(context).textTheme.caption,
              ),
            );
          }
        }

        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (BuildContext context, index) {
            return ProductItem(
              state.products[index].name,
              state.products[index].rate.toString(),
              state.products[index].image,
              state.products[index].cost,
            );
          },
        );
      },
    );
  }
}
