import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:flutter_shop/l10n/l10n.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _Logo(),
            CupertinoFormSection.insetGrouped(
              clipBehavior: Clip.none,
              header: Text(l10n.loginAuthenticationText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.transparent,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              children: [
                Column(
                  children: [
                    _UsernameInput(),
                    _PasswordInput(),
                  ],
                )
              ],
              footer: _LoginButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return CupertinoFormRow(
          key: const Key('loginForm_usernameInput_textField'),
          child: CupertinoTextField(
            placeholder: l10n.loginFormUsername,
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFFABABAB)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          error: state.username.invalid ? const Text('invalid username') : null,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CupertinoFormRow(
          key: const Key('loginForm_passwordInput_textField'),
          child: CupertinoTextField(
            key: const Key('loginForm_continue_raisedButton'),
            placeholder: l10n.loginFormPassword,
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            padding: const EdgeInsets.all(12.0),
            obscureText: true,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: const Color(0xFFABABAB)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          error: state.username.invalid ? const Text('invalid password') : null,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {

        if (state.status.isSubmissionInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CupertinoButton(
            child: Text(l10n.loginButton),
            onPressed: state.status.isValidated ?
                () => context.read<LoginBloc>().add(const LoginSubmitted())
                : null,
            color: Theme.of(context).backgroundColor,
            disabledColor: Theme.of(context).disabledColor,
          ),
        );
      },
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        Image(
          image: AssetImage('assets/logo.png'),
          width: MediaQuery.of(context).size.width / 2,
        ),
        Text(l10n.logoText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}

