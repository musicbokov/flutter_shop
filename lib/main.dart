import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:flutter_shop/bootstrap.dart';
import 'package:local_storage_flights_api/local_storage_flights_api.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  final flightsApi = LocalStorageFlightsApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(flightsApi: flightsApi);
}
