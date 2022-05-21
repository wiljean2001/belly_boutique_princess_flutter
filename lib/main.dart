import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'generated/l10n.dart';
import 'repositories/repositories.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'cubit/cubits.dart';

import 'blocs/theme.dart';
import 'config/theme_default.dart';
import 'screens/splash_screen.dart';
import 'package:belly_boutique_princess/config/routers.dart';
import 'package:belly_boutique_princess/sinple_bloc_observer.dart';
import 'package:belly_boutique_princess/screens/screens.dart';

/// Metodo main de la aplicacion flutter
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // simple bloc observer
  BlocOverrides.runZoned(
    () => {
      runApp(
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(themeDefault()),
          child: const MyApp(),
        ),
      ),
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  // Constructor

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final ThemeData getThema = theme.getTheme<ThemeData>();
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
            create: (context) => HomePageBloc(
              // authBloc: BlocProvider.of<AuthBloc>(context),
              // databaseRepository: context.read<DatabaseRepository>(),
            )..add(
                const HomeTabChangeEvent(
                    newIndex: 1), //newIndex = 0 is the first screen
              ),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(
              categoryRepository: CategoryRepository(),
            )..add(LoadCategories()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bely boutique princess',
          theme: getThema,
          /**
           * .copyWith(
              pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              },
              ),
              ),
           * */
          localizationsDelegates: const [
            // translate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: Routers.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
