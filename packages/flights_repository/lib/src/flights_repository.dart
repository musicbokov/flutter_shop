import 'package:flights_api/flights_api.dart';

/// {@template flights_repository}
/// A repository that handles todo related requests.
/// {@endtemplate}
class FlightsRepository {
  /// {@macro flights_repository}
  const FlightsRepository({
    required FlightsApi flightsApi,
  }) : _flightsApi = flightsApi;

  final FlightsApi _flightsApi;

  /// Provides a [Stream] of all todos.
  Stream<List<Flight>> getFlights() => _flightsApi.getFlights();

  /// Saves a [flight].
  ///
  /// If a [flight] with the same id already exists, it will be replaced.
  Future<void> saveFlight(Flight flight) => _flightsApi.saveFlight(flight);

  /// Deletes the todo with the given id.
  ///
  /// If no todo with the given id exists, a [FlightsNotFoundException] error is
  /// thrown.
  Future<void> deleteFlight(String id) => _flightsApi.deleteFlight(id);

  /// Deletes all completed todos.
  ///
  /// Returns the number of deleted todos.
  Future<int> clearCompleted() => _flightsApi.clearCompleted();

  /// Sets the `isCompleted` state of all todos to the given value.
  ///
  /// Returns the number of updated todos.
  Future<int> completeAll({required bool isCompleted}) =>
      _flightsApi.completeAll(isCompleted: isCompleted);
}
