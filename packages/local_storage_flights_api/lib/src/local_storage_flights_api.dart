import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flights_api/flights_api.dart';

/// {@template local_storage_todos_api}
/// A Flutter implementation of the [FlightsApi] that uses local storage.
/// {@endtemplate}
class LocalStorageFlightsApi extends FlightsApi {
  /// {@macro local_storage_todos_api}
  LocalStorageFlightsApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _flightStreamController = BehaviorSubject<List<Flight>>.seeded(const []);

  /// The key used for storing the todos locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kFlightsCollectionKey = '__flights_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final flightsJson = _getValue(kFlightsCollectionKey);
    if (flightsJson != null) {
      final flights = List<Map>.from(json.decode(flightsJson) as List)
          .map((jsonMap) => Flight.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      _flightStreamController.add(flights);
    } else {
      _flightStreamController.add(const []);
    }
  }

  @override
  Stream<List<Flight>> getFlights() => _flightStreamController.asBroadcastStream();

  @override
  Future<void> saveFlight(Flight flight) {
    final flights = [..._flightStreamController.value];
    final flightIndex = flights.indexWhere((t) => t.id == flight.id);
    if (flightIndex >= 0) {
      flights[flightIndex] = flight;
    } else {
      flights.add(flight);
    }

    _flightStreamController.add(flights);
    return _setValue(kFlightsCollectionKey, json.encode(flights));
  }

  @override
  Future<void> deleteFlight(String id) async {
    final flights = [..._flightStreamController.value];
    final flightIndex = flights.indexWhere((t) => t.id == id);
    if (flightIndex == -1) {
      throw FlightNotFoundException();
    } else {
      flights.removeAt(flightIndex);
      _flightStreamController.add(flights);
      return _setValue(kFlightsCollectionKey, json.encode(flights));
    }
  }

  @override
  Future<int> clearCompleted() async {
    final flights = [..._flightStreamController.value];
    final completedFlightsAmount = flights.where((t) => t.isCompleted).length;
    flights.removeWhere((t) => t.isCompleted);
    _flightStreamController.add(flights);
    await _setValue(kFlightsCollectionKey, json.encode(flights));
    return completedFlightsAmount;
  }

  @override
  Future<int> completeAll({required bool isCompleted}) async {
    final flights = [..._flightStreamController.value];
    final changedFlightsAmount =
        flights.where((t) => t.isCompleted != isCompleted).length;
    final newFlights = [
      for (final flight in flights) flight.copyWith(isCompleted: isCompleted)
    ];
    _flightStreamController.add(newFlights);
    await _setValue(kFlightsCollectionKey, json.encode(newFlights));
    return changedFlightsAmount;
  }
}
