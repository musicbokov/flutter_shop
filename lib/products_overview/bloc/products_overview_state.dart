part of 'products_overview_bloc.dart';

abstract class ProductsOverviewState extends Equatable {
  const ProductsOverviewState();
}

class ProductsOverviewInitial extends ProductsOverviewState {
  @override
  List<Object> get props => [];
}
