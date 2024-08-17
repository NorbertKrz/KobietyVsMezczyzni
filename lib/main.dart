import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gender_fight/business_logic/repositories/user/firebase_auth_provider.dart';
import 'package:gender_fight/routes/app_router.dart';
import 'package:gender_fight/theme.dart';
import 'business_logic/bloc/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(FirebaseAuthProvider()),
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is AuthStateLoggedIn) {
            isLoggedIn = true;
          } else {
            isLoggedIn = false;
          }
          if (state is InitialAuthenticationState) {
            context.read<UserBloc>().add(AuthInitializeEvent());
          }
          return MaterialApp.router(
            localizationsDelegates: const [
              ...GlobalMaterialLocalizations.delegates,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('pl', ''),
              Locale('en', ''),
            ],
            debugShowCheckedModeBanner: false,
            // theme: ThemeData.dark(),
            title: 'Walka płci',
            theme: AppTheme.lightTheme(context).copyWith(
                pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            })),
            routerConfig: AppRouter(isLoggedIn: isLoggedIn).config(),
          );
        },
      ),
    );
  }
}
