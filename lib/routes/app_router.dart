import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gender_fight/ui/game_view/game_screen.dart';
import 'package:gender_fight/ui/home_view/home_view.dart';
import 'package:gender_fight/ui/how_play/how_play_view.dart';
import 'package:gender_fight/ui/randomization_screen/randomization_screen.dart';
import 'package:gender_fight/ui/vocabulary_view/vocabulary_view.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  final bool isLoggedIn;

  AppRouter({super.navigatorKey, required this.isLoggedIn});

  @override
  List<AutoRoute> get routes => [
        // CustomRoute(
        //   transitionsBuilder: TransitionsBuilders.fadeIn,
        //   durationInMilliseconds: 200,
        //   page: SplashRoute.page,
        //   initial: isLoggedIn ? false : true,
        // ),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100,
            // initial: isLoggedIn ? false : true,
            page: SignInRoute.page),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100,
            initial: isLoggedIn ? false : true,
            page: HomeRoute.page),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100,
            page: RandomSelectionRoute.page),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100,
            page: SignUpRoute.page),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 300,
            page: GameRoute.page),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100,
            page: HowPlayRoute.page),
        CustomRoute(
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100,
            page: VocabularyRoute.page),
      ];
}

class AuthGuard extends AutoRouteGuard {
  final bool isLoggedIn;

  AuthGuard({required this.isLoggedIn});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (isLoggedIn) {
      resolver.next(true);
    } else {
      router.push(const SignInRoute());
      resolver.next(false);
    }
  }
}
