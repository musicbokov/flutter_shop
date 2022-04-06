import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flights_api/flights_api.dart';
import 'package:flights_repository/flights_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop/app/app.dart';
import 'package:flutter_shop/app/app_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void bootstrap({required FlightsApi flightsApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final flightsRepository = FlightsRepository(flightsApi: flightsApi);
  final userRepository = UserRepository();
  final authenticationRepository = AuthenticationRepository();

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(
            flightsRepository: flightsRepository,
            authenticationRepository: authenticationRepository,
            userRepository: userRepository,
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
