import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restfull_repository/restfull_repository.dart';

part 'products_overview_event.dart';
part 'products_overview_state.dart';

class ProductsOverviewBloc extends Bloc<ProductsOverviewEvent, ProductsOverviewState> {
  ProductsOverviewBloc(this.groupId, {
    required RestfullRepository restfullRepository,
  }) : _restfullRepository = restfullRepository,
        super(ProductsOverviewState(groupId: groupId)) {
    on<ProductsOverviewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final RestfullRepository _restfullRepository;
  final int groupId;

  Future<void> _onSubscriptionRequested(
      ProductsOverviewSubscriptionRequested event,
      Emitter<ProductsOverviewState> emit,
      ) async {
    emit(state.copyWith(
      groupId: () => groupId,
      status: () => ProductsOverviewStatus.loading),
    );

    await emit.forEach<List<Product>>(
      _restfullRepository.getProducts(groupId),
      onData: (products) => state.copyWith(
        groupId: () => groupId,
        status: () => ProductsOverviewStatus.success,
        products: () => products,
      ),
    );
  }
}
