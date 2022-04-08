import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_shop/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_shop/l10n/l10n.dart';
import 'package:flutter_shop/app/routes/routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restfull_repository/restfull_repository.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.restfullRepository,
    required this.userRepository,
    required AuthenticationRepository authenticationRepository,
  }) :  _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final UserRepository userRepository;
  final RestfullRepository restfullRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: restfullRepository),
      ],
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: userRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlowBuilder<AuthenticationStatus>(
        state: context.select((AuthenticationBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}

