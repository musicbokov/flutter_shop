part of 'home_cubit.dart';

enum HomeTab { catalog, cart, profile }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.catalog,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
