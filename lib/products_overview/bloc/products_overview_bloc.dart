import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'products_overview_event.dart';
part 'products_overview_state.dart';

class ProductsOverviewBloc extends Bloc<ProductsOverviewEvent, ProductsOverviewState> {
  ProductsOverviewBloc() : super(ProductsOverviewInitial()) {
    on<ProductsOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
