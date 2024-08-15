import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'calculator_api_service.g.dart';

@RestApi()
abstract class CalculatorApiService {
  factory CalculatorApiService(Dio dio, {String baseUrl}) =
      _CalculatorApiService;

  /// URLS
  static const String _createDailyNutrient = 'api/v1/daily-nutrient-calculations';
  static const String _fishTypes = 'api/v1/fish-types';
  static const String _foodTypes = 'api/v1/food-types';
  static const String _nutritionalInfos = 'api/v1/nutritional-infos/by-fish-type/{id}';

  /// REQUESTS
  @POST(_createDailyNutrient)
  Future<HttpResponse<CreateDailyNutrientModel>> createDailyNutrient(
      @Body() CreateDailyNutrientBody body);

  @GET(_fishTypes)
  Future<HttpResponse<List<FishTypes>>> fishTypes();

  @GET(_foodTypes)
  Future<HttpResponse<List<FishTypes>>> foodTypes();

  @GET(_nutritionalInfos)
  Future<HttpResponse<List<NutritionalInfoModel>>> nutritionalInfos(
      @Path('id') String id);
}
