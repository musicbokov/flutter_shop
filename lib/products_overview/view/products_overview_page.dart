import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/products_overview/products_overview.dart';
import 'package:restfull_repository/restfull_repository.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage(this.groupName, {Key? key}) : super(key: key);

  static Route<void> route(int groupId, String groupName) {
    return MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => BlocProvider(
          create: (context) => ProductsOverviewBloc(groupId,
            restfullRepository: context.read<RestfullRepository>(),
          )..add(const ProductsOverviewSubscriptionRequested()),
          child: ProductsOverviewPage(groupName),
        ),
    );
  }

  final String groupName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(groupName),
          automaticallyImplyLeading: false,
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<ProductsOverviewBloc, ProductsOverviewState>(
              listenWhen: (previous, current) =>
              previous.status != current.status,
              listener: (context, state) {},
            ),
          ],
          child: const ProductsOverviewView(),
        ),
    );
  }
}
