import 'package:belly_boutique_princess/config/routers.dart';
import 'package:belly_boutique_princess/screens/screens.dart';
import 'package:flutter/material.dart';

import 'blocs/home/home_page_bloc.dart';
import 'config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'repositories/repositories.dart';

import 'blocs/blocs.dart';
import 'cubit/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/splash_screen.dart';

// import 'package:bely_boutique/widgets/onboarding_screen.dart';

// import 'dart:async';
// import 'package:animated_splash_screen/animated_splash_screen.dart';

// import 'package:bely_boutique/screens/home_screen.dart';
// import 'screens/auth/login/login_screen.dart';

/// Metodo main de la aplicacion flutter
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "XXX",
    //   appId: "XXX",
    //   messagingSenderId: "XXX",
    //   projectId: "XXX",
    // ),
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Constructor

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
     * MultiRepositoryProvider
     */
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        //
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignupCubit>(
            create: (context) =>
                SignupCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<OnboardingBloc>(
            create: (context) => OnboardingBloc(
              databaseRepository: context.read<DatabaseRepository>(),
              storageRepository: context.read<StorageRepository>(),
            ),
          ),
          BlocProvider(
              create: (context) => SwipeBloc(
                    authBloc: BlocProvider.of<AuthBloc>(context),
                    databaseRepository: context.read<DatabaseRepository>(),
                  )
              //BlocProvider.of<AuthBloc>(context).state.user!.uid),
              ),
          BlocProvider(
            create: (context) => ProfileBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              databaseRepository: context.read<DatabaseRepository>(),
              // una vez es instanciado se inyectara el metodo add
            )..add(
                LoadProfile(
                    userId: BlocProvider.of<AuthBloc>(context).state.user!.uid),
              ),
          ),
          BlocProvider(
            create: (_) => HomePageBloc()
              ..add(
                const HomeTabChangeEvent(
                    newIndex: 0), //newIndex = 0 is the first screen
              ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bely boutique princess',
          // theme: ThemeData(
          //   primarySwatch: Colors.pink,
          // ),
          theme: theme(),
          // home: SplashScreen(),
          onGenerateRoute: Routers.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
