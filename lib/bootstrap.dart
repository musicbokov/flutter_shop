import 'dart:async';
import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shop/app/app.dart';
import 'package:flutter_shop/app/app_bloc_observer.dart';
import 'package:restfull_repository/restfull_repository.dart';
import 'package:user_repository/user_repository.dart';

void bootstrap({required RestfullApi restfullApi}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final restfullRepository = RestfullRepository(restfullApi: restfullApi);
  final userRepository = UserRepository();
  final authenticationRepository = AuthenticationRepository();

  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          App(
            restfullRepository: restfullRepository,
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
