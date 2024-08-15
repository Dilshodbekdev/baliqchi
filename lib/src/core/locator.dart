import 'dart:io';

import 'package:baliqchi/src/core/app_state/cubit/app_cubit.dart';
import 'package:baliqchi/src/core/network/api_interceptor.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:baliqchi/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:baliqchi/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:baliqchi/src/features/auth/domain/repository/auth_repository.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/check_sms_use_case.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/register_use_case.dart';
import 'package:baliqchi/src/features/auth/domain/use_case/send_sms_use_case.dart';
import 'package:baliqchi/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:baliqchi/src/features/calculator/data/data_source/calculator_api_service.dart';
import 'package:baliqchi/src/features/calculator/data/repository/calculator_repository_impl.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/create_daily_nutrient_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_types1_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/food_types1_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/nutritional_infos_use_case.dart';
import 'package:baliqchi/src/features/calculator/presentation/manager/calculator_bloc.dart';
import 'package:baliqchi/src/features/diseases/data/data_source/diseases_api_service.dart';
import 'package:baliqchi/src/features/diseases/data/repository/diseases_repository_impl.dart';
import 'package:baliqchi/src/features/diseases/domain/repository/disease_repository.dart';
import 'package:baliqchi/src/features/diseases/domain/use_case/diseases_use_case.dart';
import 'package:baliqchi/src/features/diseases/presentation/manager/disease_bloc.dart';
import 'package:baliqchi/src/features/economic/data/data_source/economic_api_service.dart';
import 'package:baliqchi/src/features/economic/data/repository/economic_repository_impl.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/create_economic_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/create_expense_month_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/details_economic_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/economics_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/expense_types_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/expenses_month_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/fish_types_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/food_types_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/technologies_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/update_economic_use_case.dart';
import 'package:baliqchi/src/features/economic/presentation/manager/economic_bloc.dart';
import 'package:baliqchi/src/features/home/data/data_source/home_api_service.dart';
import 'package:baliqchi/src/features/home/data/repository/home_repository_impl.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';
import 'package:baliqchi/src/features/home/domain/use_case/billings_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/definitions_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/place_details_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/places_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/regions_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/technologies1_use_case.dart';
import 'package:baliqchi/src/features/home/presentation/manager/home_bloc.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  );
  dio.interceptors.add(CookieManager(PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage("$appDocPath/.cookies/"),
  )));
  dio.interceptors.add(ApiInterceptor());
  locator.registerSingleton<Dio>(dio);

  locator.registerFactory(() => AppCubit());

  // Services
  locator.registerSingleton(AuthApiService(locator()));
  locator.registerSingleton(HomeApiService(locator()));
  locator.registerSingleton(DiseasesApiService(locator()));
  locator.registerSingleton(EconomicApiService(locator()));
  locator.registerSingleton(CalculatorApiService(locator()));

  // Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<DiseaseRepository>(DiseasesRepositoryImpl(locator()));
  locator.registerSingleton<EconomicRepository>(EconomicRepositoryImpl(locator()));
  locator.registerSingleton<CalculatorRepository>(CalculatorRepositoryImpl(locator()));

  // Auth UseCases
  locator.registerSingleton(LoginUseCase(locator()));
  locator.registerSingleton(RegisterUseCase(locator()));
  locator.registerSingleton(SendSmsUseCase(locator()));
  locator.registerSingleton(CheckSmsUseCase(locator()));

  // Home UseCases
  locator.registerSingleton(PlacesUseCase(locator()));
  locator.registerSingleton(RegionsUseCase(locator()));
  locator.registerSingleton(DefinitionsUseCase(locator()));
  locator.registerSingleton(BillingsUseCase(locator()));
  locator.registerSingleton(Technologies1UseCase(locator()));
  locator.registerSingleton(PlaceDetailsUseCase(locator()));

  // Diseases UseCase
  locator.registerSingleton(DiseasesUseCase(locator()));

  // Economic UseCase
  locator.registerSingleton(EconomicsUseCase(locator()));
  locator.registerSingleton(ExpensesMonthUseCase(locator()));
  locator.registerSingleton(FishTypesUseCase(locator()));
  locator.registerSingleton(FoodTypesUseCase(locator()));
  locator.registerSingleton(ExpenseTypesUseCase(locator()));
  locator.registerSingleton(TechnologiesUseCase(locator()));
  locator.registerSingleton(CreateEconomicUseCase(locator()));
  locator.registerSingleton(CreateExpenseMonthUseCase(locator()));
  locator.registerSingleton(DetailsEconomicUseCase(locator()));
  locator.registerSingleton(UpdateEconomicUseCase(locator()));

  //Calculator UseCase
  locator.registerSingleton(CreateDailyNutrientUseCase(locator()));
  locator.registerSingleton(FoodTypes1UseCase(locator()));
  locator.registerSingleton(FishTypes1UseCase(locator()));
  locator.registerSingleton(NutritionalInfosUseCase(locator()));

  // Blocs
  locator.registerFactory<AuthBloc>(
    () => AuthBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<HomeBloc>(
    () => HomeBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<DiseaseBloc>(
    () => DiseaseBloc(
      locator(),
    ),
  );
  locator.registerFactory<EconomicBloc>(
    () => EconomicBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<CalculatorBloc>(
        () => CalculatorBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
}
