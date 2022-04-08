part of 'catalog_bloc.dart';

enum CatalogStatus { initial, loading, success }

class CatalogState extends Equatable {
  const CatalogState({
    this.status = CatalogStatus.initial,
    this.groups = const [],
  });

  final CatalogStatus status;
  final List<Group> groups;

  CatalogState copyWith({
    CatalogStatus Function()? status,
    List<Group> Function()? groups,
  }) {
    return CatalogState(
      status: status != null ? status() : this.status,
      groups: groups != null ? groups() : this.groups,
    );
  }

  @override
  List<Object?> get props => [
    status,
    groups,
  ];
}