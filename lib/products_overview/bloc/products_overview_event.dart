part of 'products_overview_bloc.dart';

abstract class ProductsOverviewEvent extends Equatable {
  const ProductsOverviewEvent();

  @override
  List<Object> get props => [];
}

class ProductsOverviewSubscriptionRequested extends ProductsOverviewEvent {
  const ProductsOverviewSubscriptionRequested();
}
