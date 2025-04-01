import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/router/route_transitions.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/check_sms_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/confirmation_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/language_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/login_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/register_page.dart';
import 'package:baliqchi/src/features/auth/presentation/pages/splash_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/create_daily_calculations_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/create_fish_decline_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/create_general_calculation_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/create_pond_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/fish_decline_details_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/fish_decline_history_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/fish_decline_statistics_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/general_calculation_details_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/general_calculation_list_details_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/general_calculation_list_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/general_calculations_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/pond_details_page.dart';
import 'package:baliqchi/src/features/calculator/presentation/pages/pond_fish_page.dart';
import 'package:baliqchi/src/features/diseases/presentation/pages/disease_details_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/create_economic_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/create_expense_month_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/details_economic_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/expense_month_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/expense_month_statistics_page.dart';
import 'package:baliqchi/src/features/economic/presentation/pages/filter_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/billings_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/definitions_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/delete_account_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/pay_me_card_page.dart';
import 'package:baliqchi/src/features/home/presentation/pages/pay_me_code_page.dart';
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
      name: AppRoutes.deleteAccount.name,
      path: AppRoutes.deleteAccount.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const DeleteAccountPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.payMeCard.name,
      path: AppRoutes.payMeCard.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => PayMeCardPage(
        model: state.pathParameters['model']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.payMeCode.name,
      path: AppRoutes.payMeCode.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => PayMeCodePage(
        model: state.pathParameters['model']!,
        id: state.pathParameters['id']!,
        name: state.pathParameters['name']!,
      ).defaultPage(state: state),
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
        title: state.pathParameters['title']!,
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
      name: AppRoutes.expenseMonthStatistics.name,
      path: AppRoutes.expenseMonthStatistics.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const ExpenseMonthStatisticsPage().defaultPage(state: state),
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
          const CreateDailyCalculationsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createPond.name,
      path: AppRoutes.createPond.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CreatePondPage(
        pondJson: state.pathParameters['pond']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createFishDecline.name,
      path: AppRoutes.createFishDecline.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const CreateFishDeclinePage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.fishDeclineDetails.name,
      path: AppRoutes.fishDeclineDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const FishDeclineDetailsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.fishDeclineStatistics.name,
      path: AppRoutes.fishDeclineStatistics.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const FishDeclineStatisticsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.detailsEconomic.name,
      path: AppRoutes.detailsEconomic.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => DetailsEconomicPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.pondFish.name,
      path: AppRoutes.pondFish.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => PondFishPage(
        pondJson: state.pathParameters['pond']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.generalCalculations.name,
      path: AppRoutes.generalCalculations.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => GeneralCalculationsPage(
        pondJson: state.pathParameters['pond']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.fishDeclineHistory.name,
      path: AppRoutes.fishDeclineHistory.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => FishDeclineHistoryPage(
        pondJson: state.pathParameters['pond']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.generalCalculationList.name,
      path: AppRoutes.generalCalculationList.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => GeneralCalculationListPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createGeneralCalculations.name,
      path: AppRoutes.createGeneralCalculations.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => CreateGeneralCalculationPage(
        pond: state.pathParameters['pond']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.generalCalculationDetails.name,
      path: AppRoutes.generalCalculationDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => GeneralCalculationDetailsPage(
        id: state.pathParameters['id']!,
        pondId: state.pathParameters['pondId']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.generalCalculationListDetails.name,
      path: AppRoutes.generalCalculationListDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => GeneralCalculationListDetailsPage(
        id: state.pathParameters['id']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.pondDetails.name,
      path: AppRoutes.pondDetails.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => PondDetailsPage(
        pondJson: state.pathParameters['pond']!,
      ).defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.filter.name,
      path: AppRoutes.filter.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const FilterPage().defaultPage(state: state),
    ),
  ],
);
