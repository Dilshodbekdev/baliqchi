import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_pond_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_details_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_history_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_statistic_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_declines_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/food_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculation_details_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculations_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_fish_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pont_details_model.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'calculator_api_service.g.dart';

@RestApi()
abstract class CalculatorApiService {
  factory CalculatorApiService(Dio dio, {String baseUrl}) =
      _CalculatorApiService;

  /// URLS
  static const String _createDailyNutrient =
      'api/v1/daily-nutrient-calculations';
  static const String _createPond = 'api/v1/ponds';
  static const String _pondDetails = 'api/v1/ponds/{id}';
  static const String _fishTypes = 'api/v1/fish-types/for-feeding';
  static const String _foodTypes = 'api/v1/food-types';
  static const String _generalNutritionalInfosFoods =
      'api/v1/general-nutritional-infos/foods/{fishTypeId}';
  static const String _generalNutritionalInfos =
      'api/v1/general-nutritional-infos/{fishTypeId}/{foodTypeId}';
  static const String _generalCalculations = 'api/v1/general-calculations';
  static const String _generalCalculationDetails =
      'api/v1/general-calculations/{id}';
  static const String _generalCalculationList =
      'api/v1/general-calculations/list/{id}';
  static const String _nutritionalInfos =
      'api/v1/nutritional-infos/by-fish-type/{id}';
  static const String _technologies = 'api/v1/technologies/all';
  static const String _pondFishes = 'api/v1/ponds/fishes';
  static const String _fishDeclines = 'api/v1/fish-declines';
  static const String _fishDeclinesHistory = 'api/v1/fish-declines/histories';
  static const String _fishDeclineStatistic = 'api/v1/fish-declines/statistics';
  static const String _fishDeclineDetails = 'api/v1/fish-declines/{id}';

  /// REQUESTS
  @POST(_createDailyNutrient)
  Future<HttpResponse<CreateDailyNutrientModel>> createDailyNutrient(
    @Body() CreateDailyNutrientBody body,
  );

  @POST(_createPond)
  Future<HttpResponse<DefaultModel>> createPond(@Body() CreatePondBody body);

  @PUT(_pondDetails)
  Future<HttpResponse<DefaultModel>> updatePond(
    @Body() CreatePondBody body,
    @Path('id') String pondId,
  );

  @GET(_createPond)
  Future<HttpResponse<List<PondModel>>> ponds();

  @GET(_fishTypes)
  Future<HttpResponse<List<FishTypes>>> fishTypes();

  @GET(_foodTypes)
  Future<HttpResponse<List<FishTypes>>> foodTypes();

  @GET(_generalNutritionalInfosFoods)
  Future<HttpResponse<List<FoodModel>>> generalNutritionalInfosFoods(
      @Path('fishTypeId') String fishTypeId);

  @GET(_generalNutritionalInfos)
  Future<HttpResponse<List<GeneralNutritionalInfoModel>>>
      generalNutritionalInfos(
    @Path('fishTypeId') String fishTypeId,
    @Path('foodTypeId') String foodTypeId,
  );

  @GET(_generalCalculations)
  Future<HttpResponse<GeneralCalculationsModel>> generalCalculations(
    @Query('page') int page,
    @Query('size') int size,
    @Query('pondId') String? pondId,
  );

  @GET(_fishDeclines)
  Future<HttpResponse<FishDeclinesModel>> fishDeclines(
    @Query('page') int page,
    @Query('size') int size,
    @Query('pondId') String? pondId,
    @Query('fishTypeId') String? fishTypeId,
  );

  @GET(_fishDeclinesHistory)
  Future<HttpResponse<FishDeclineHistoryModel>> fishDeclinesHistory(
    @Query('page') int page,
    @Query('size') int size,
    @Query('pondId') String? pondId,
  );

  @GET(_fishDeclineDetails)
  Future<HttpResponse<FishDeclineDetailsModel>> fishDeclineDetails(
      @Path('id') String id);

  @DELETE(_fishDeclineDetails)
  Future<HttpResponse<DefaultModel>> deleteFishDecline(@Path('id') String id);

  @GET(_fishDeclineStatistic)
  Future<HttpResponse<FishDeclineStatisticModel>> fishDeclineStatistic(
    @Query('year') int year,
    @Query('fishTypeId') String? fishTypeId,
  );

  @POST(_fishDeclines)
  Future<HttpResponse<DefaultModel>> createFishDecline(
    @Query('pondId') String? pondId,
    @Query('fishTypeId') String? fishTypeId,
    @Query('fishAmount') int? fishAmount,
    @Query('weight') int? weight,
    @Query('declineType') String? declineType,
    @Query('description') String? description,
    @Query('price') int? price,
    @Query('date') String? date,
  );

  @GET(_generalCalculationList)
  Future<HttpResponse<List<GeneralCalculation>>> generalCalculationList(
    @Path('id') String? id,
  );

  @GET(_generalCalculationDetails)
  Future<HttpResponse<GeneralCalculationDetailsModel>>
      generalCalculationDetails(@Path('id') String id);

  @DELETE(_generalCalculationDetails)
  Future<HttpResponse<DefaultModel>> deleteGeneralCalculation(
      @Path('id') String id);

  @PATCH(_generalCalculationDetails)
  Future<HttpResponse<DefaultModel>> updateGeneralCalculation(
      @Path('id') String id, @Body() UpdateGeneralCalculationBody body);

  @POST(_generalCalculations)
  Future<HttpResponse<DefaultModel>> createGeneralCalculation(
      @Body() CreateGeneralCalculationBody body);

  @GET(_technologies)
  Future<HttpResponse<List<TechnologyModel>>> technologies();

  @GET(_nutritionalInfos)
  Future<HttpResponse<List<NutritionalInfoModel>>> nutritionalInfos(
      @Path('id') String id);

  @GET(_pondDetails)
  Future<HttpResponse<PontDetailsModel>> pontDetails(@Path('id') String id);

  @GET(_pondFishes)
  Future<HttpResponse<List<PondFishModel>>> pondFishes();
}
