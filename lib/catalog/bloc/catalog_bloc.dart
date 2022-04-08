import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restfull_repository/restfull_repository.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({
    required RestfullRepository restfullRepository
  }) : _restfullRepository = restfullRepository,
       super(const CatalogState()) {
    on<CatalogSubscriptionRequested>(_onSubscriptionRequested);
  }

  final RestfullRepository _restfullRepository;

  Future<void> _onSubscriptionRequested(
      CatalogSubscriptionRequested event,
      Emitter<CatalogState> emit,
      ) async {
    emit(state.copyWith(status: () => CatalogStatus.loading));

    await emit.forEach<List<Group>>(
      _restfullRepository.getGroups(),
      onData: (groups) => state.copyWith(
        status: () => CatalogStatus.success,
        groups: () => groups,
      ),
    );
  }
}
