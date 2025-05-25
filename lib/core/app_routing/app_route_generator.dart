import 'package:articlely/core/app_routing/routes_names.dart';
import 'package:articlely/features/news/presentation/manager/categories/categories_cubit.dart';
import 'package:articlely/features/news/presentation/manager/news/news_cubit.dart';
import 'package:articlely/features/sign_in/presentation/manager/sign_in_cubit.dart';
import 'package:articlely/features/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:articlely/features/sign_up/sign_up_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/Splash/presentation/pages/splash_screen.dart';
import '../../features/news/home_di.dart';
import '../../features/sign_in/presentation/pages/sign_in_screen.dart';
import '../../features/sign_in/sign_in_di.dart';
import '../../features/sign_up/presentation/pages/sign_up_screen.dart';
import '../constants/constants.dart';
import '../navBar/presentation/manager/nav_bar_cubit.dart';
import '../navBar/presentation/pages/nav_bar.dart';
import 'package:get_it/get_it.dart';

class AppRouteGenerator {
  AppRouteGenerator();

  final sl = GetIt.instance;

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splash:
        return _buildPageRoute(builder: (_) => SplashScreen());

      case RoutesNames.login:
        SignInDi().initDi();
        return _buildPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl<SignInCubit>(),
                  child: const SignInScreen(),
                ));

      case RoutesNames.signUp:
        SignUpDi().initDi();
        return _buildPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => sl<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));

      case RoutesNames.home:
        HomeServices().initDi();
        return _buildPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => sl<NavBarCubit>(),
                ),
                BlocProvider(
                  create: (_) => sl<NewsCubit>()
                    ..getNews(
                        '${Constants.apiBaseUrl}${Constants.getNewApi}news'),
                ),
                BlocProvider(
                  create: (_) => sl<CategoryCubit>(),
                ),
              ],
              child: NavBarScreen(),
            );
          },
        );

      default:
        return _buildPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  Route _buildPageRoute({required WidgetBuilder builder}) {
    return MaterialPageRoute(builder: builder);
  }
}
