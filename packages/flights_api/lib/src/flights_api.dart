import 'package:flights_api/flights_api.dart';

/// {@template flights_api}
/// The interface for an API that provides access to a list of todos.
/// {@endtemplate}
abstract class FlightsApi {
  /// {@macro flights_api}
  const FlightsApi();

  /// Provides a [Stream] of all todos.
  Stream<List<Flight>> getFlights();

  /// Saves a [flight].
  ///
  /// If a [flight] with the same id already exists, it will be replaced.
  Future<void> saveFlight(Flight flight);

  /// Deletes the todo with the given id.
  ///
  /// If no todo with the given id exists, a [FlightNotFoundException] error is
  /// thrown.
  Future<void> deleteFlight(String id);

  /// Deletes all completed todos.
  ///
  /// Returns the number of deleted todos.
  Future<int> clearCompleted();

  /// Sets the `isCompleted` state of all todos to the given value.
  ///
  /// Returns the number of updated todos.
  Future<int> completeAll({required bool isCompleted});
}

/// Error thrown when a [Flight] with a given id is not found.
class FlightNotFoundException implements Exception {}
