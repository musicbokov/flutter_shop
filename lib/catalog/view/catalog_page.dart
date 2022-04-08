import 'package:flutter_shop/catalog/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/l10n/l10n.dart';
import 'package:restfull_repository/restfull_repository.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatalogBloc(
        restfullRepository: context.read<RestfullRepository>(),
      )..add(const CatalogSubscriptionRequested()),
      child: const _CatalogPage(),
    );
  }
}


class _CatalogPage extends StatelessWidget {
  const _CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.catalogAppBarTitle)),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CatalogBloc, CatalogState>(
            listenWhen: (previous, current) =>
            previous.status != current.status,
            listener: (context, state) {},
          ),
        ],
        child: const CatalogView(),
      ),
    );
  }
}
