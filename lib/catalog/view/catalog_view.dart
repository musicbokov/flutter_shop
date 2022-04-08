import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/catalog/bloc/catalog_bloc.dart';
import 'package:flutter_shop/l10n/l10n.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state.groups.isEmpty) {
          if (state.status == CatalogStatus.loading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state.status != CatalogStatus.success) {
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
                  itemCount: state.groups.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(ProductsOverviewPage.route(state.groups[index].id, state.groups[index].name));
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Image(
                              image: AssetImage(state.groups[index].image),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.groups[index].name,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${state.groups[index].count} шт.'),
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
      },
    );
  }
}
