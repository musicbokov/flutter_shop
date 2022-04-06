import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_shop/home/home.dart';
import 'package:flutter_shop/login/view/login_page.dart';
import 'package:flutter/widgets.dart';

List<Page> onGenerateAppViewPages(AuthenticationStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [HomePage.page()];
    case AuthenticationStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
