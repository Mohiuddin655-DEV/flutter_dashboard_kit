import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart';
import 'feature/presentation/cubits/auth_cubit.dart';
import 'feature/presentation/cubits/user_cubit.dart';
import 'feature/presentation/page/auth/sign_in/auth_sign_in_page.dart';
import 'feature/presentation/page/auth/sign_up/auth_sign_up_page.dart';
import 'feature/presentation/page/dashboard/page.dart';
import 'feature/presentation/page/error/error_page.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case DashboardPage.route:
        return routeBuilder(widget: _home());
      case AuthSignInPage.route:
        return routeBuilder(widget: _signIn());
      case AuthSignUpPage.route:
        return routeBuilder(widget: _signUp());
      default:
        return routeBuilder(widget: const ErrorPage());
    }
  }
}

MaterialPageRoute routeBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}

Widget _home() {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => locator<UserCubit>(),
      ),
    ],
    child: const DashboardPage(),
  );
}

Widget _signIn() {
  return BlocProvider(
    create: (context) => locator<AuthCubit>()..isLoggedIn,
    child: const AuthSignInPage(),
  );
}

Widget _signUp() {
  return BlocProvider(
    create: (context) => locator<AuthCubit>()..isLoggedIn,
    child: const AuthSignUpPage(),
  );
}
