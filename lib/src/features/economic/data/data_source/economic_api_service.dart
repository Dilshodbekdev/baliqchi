import 'package:baliqchi/src/features/economic/data/bodies/create_economic_body.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'economic_api_service.g.dart';

@RestApi()
abstract class EconomicApiService {
  factory EconomicApiService(Dio dio, {String baseUrl}) = _EconomicApiService;

  /// URLS
  static const String _economics = 'api/v1/economic-indicators/all';
  static const String _expensesMonth = 'api/v1/expense-month';
  static const String _createEconomics = 'api/v1/economic-indicators';
  static const String _detailsEconomics = 'api/v1/economic-indicators/{id}';
  static const String _fishTypes = 'api/v1/fish-types';
  static const String _foodTypes = 'api/v1/food-types';
  static const String _expenseTypes = 'api/v1/expense-types';
  static const String _technologies = 'api/v1/technologies/all';

  /// REQUESTS
  @GET(_economics)
  Future<HttpResponse<EconomicsModel>> economics(
    @Query('page') int page,
    @Query('size') int size,
    @Query('search') String? search,
  );

  @GET(_expensesMonth)
  Future<HttpResponse<ExpensesMonthModel>> expensesMonth(
      @Query('page') int page,
      @Query('size') int size,
      @Query('search') String? search,
      );

  @GET(_detailsEconomics)
  Future<HttpResponse<DetailsEconomicModel>> detailsEconomics(
      @Path('id') String id);

  @PATCH(_detailsEconomics)
  Future<HttpResponse<DetailsEconomicModel>> updateEconomics(
      @Path('id') String id, @Query('plannedPriceFish') double price);

  @POST(_createEconomics)
  Future<HttpResponse<DefaultModel>> createEconomic(
      @Body() CreateEconomicBody body);

  @POST(_expensesMonth)
  Future<HttpResponse<DefaultModel>> createExpenseMonth(
      @Body() List<ExpenseMonthBody> body);

  @GET(_fishTypes)
  Future<HttpResponse<List<FishTypes>>> fishTypes();

  @GET(_technologies)
  Future<HttpResponse<List<TechnologyModel>>> technologies();

  @GET(_foodTypes)
  Future<HttpResponse<List<FishTypes>>> foodTypes();

  @GET(_expenseTypes)
  Future<HttpResponse<List<ExpenseTypeModel>>> expenseTypes();
}
