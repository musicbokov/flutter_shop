import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:flutter_shop/bootstrap.dart';
import 'package:example_api/example_api.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  final exampleApi = ExampleApi();

  bootstrap(restfullApi: exampleApi);
}
