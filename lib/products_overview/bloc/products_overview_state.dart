part of 'products_overview_bloc.dart';

enum ProductsOverviewStatus { initial, loading, success }

class ProductsOverviewState extends Equatable {
  const ProductsOverviewState({
    required this.groupId,
    this.status = ProductsOverviewStatus.initial,
    this.products = const [],
  });

  final int groupId;
  final ProductsOverviewStatus status;
  final List<Product> products;

  ProductsOverviewState copyWith({
    int Function()? groupId,
    ProductsOverviewStatus Function()? status,
    List<Product> Function()? products,
  }) {
    return ProductsOverviewState(
      groupId: groupId != null ? groupId() : this.groupId,
      status: status != null ? status() : this.status,
      products: products != null ? products() : this.products,
    );
  }

  @override
  List<Object?> get props => [
    groupId,
    status,
    products,
  ];
}
