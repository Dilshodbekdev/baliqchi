import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/router/route_transitions.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/check_sms_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/confirmation_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/language_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/login_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/register_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/splash_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/create_daily_calculations.dart';
import 'package:baliqchi/src/features/diseases/presentation/pages/disease_details_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/create_economic_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/create_expense_month_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/details_economic_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/expense_month_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/billings_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/definitions_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/place_details_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/technology_details_page.dart';
import 'package:baliqchi/src/features/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: rootNavigator,
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SplashPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.language.name,
      path: AppRoutes.language.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LanguagePage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.login.name,
      path: AppRoutes.login.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LoginPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.register.name,
      path: AppRoutes.register.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => RegisterPage(
        phone: state.pathParameters['phone']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.confirmation.name,
      path: AppRoutes.confirmation.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ConfirmationPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.checkSms.name,
      path: AppRoutes.checkSms.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CheckSmsPage(
        phone: state.pathParameters['phone']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.main.name,
      path: AppRoutes.main.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MainPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.definitions.name,
      path: AppRoutes.definitions.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const DefinitionsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.billings.name,
      path: AppRoutes.billings.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const BillingsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.placeDetails.name,
      path: AppRoutes.placeDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => PlaceDetailsPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.technologyDetails.name,
      path: AppRoutes.technologyDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => TechnologyDetailsPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.diseaseDetails.name,
      path: AppRoutes.diseaseDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => DiseaseDetailsPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createEconomic.name,
      path: AppRoutes.createEconomic.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const CreateEconomicPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.expenseMonth.name,
      path: AppRoutes.expenseMonth.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ExpenseMonthPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createExpenseMonth.name,
      path: AppRoutes.createExpenseMonth.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const CreateExpenseMonthPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createDailyNutrient.name,
      path: AppRoutes.createDailyNutrient.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const CreateDailyCalculations().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.detailsEconomic.name,
      path: AppRoutes.detailsEconomic.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => DetailsEconomicPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
  ],
);
