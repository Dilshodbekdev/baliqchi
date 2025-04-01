import 'package:baliqchi/generated/l10n.dart';
import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/locator.dart';
import 'package:baliqchi/src/core/router/route_config.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/diseases/presentation/manager/disease_bloc.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:baliqchi/src/features/main/manger/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AppCubit>()..init()),
          BlocProvider(create: (context) => locator<MainCubit>()..init()),
          BlocProvider(create: (context) => locator<AuthBloc>()),
          BlocProvider(create: (context) => locator<HomeBloc>()),
          BlocProvider(create: (context) => locator<DiseaseBloc>()),
          BlocProvider(create: (context) => locator<EconomicBloc>()),
          BlocProvider(create: (context) => locator<CalculatorBloc>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return ToastificationWrapper(
              child: MaterialApp.router(
                locale: state.locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Baliqchiga Ko\'makchi',
                theme: ThemeData(
                  appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white
                  ),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white
                  ),
                  useMaterial3: true
                ),
                routeInformationParser: appRouter.routeInformationParser,
                routeInformationProvider: appRouter.routeInformationProvider,
                routerDelegate: appRouter.routerDelegate,
              ),
            );
          },
        ));
  }
}