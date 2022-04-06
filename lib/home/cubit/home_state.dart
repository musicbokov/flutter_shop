part of 'home_cubit.dart';

enum HomeTab { flightList, stats, flightListOrig }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.flightList,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
