import 'package:baliqchi/src/core/resources/base_repository.dart';
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/data_source/calculator_api_service.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';

class CalculatorRepositoryImpl
    with BaseRepository
    implements CalculatorRepository {
  final CalculatorApiService _apiService;

  CalculatorRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<FishTypes>>> fishTypes() async =>
      await handleResponse(response: _apiService.fishTypes());

  @override
  Future<DataState<List<FishTypes>>> foodTypes() async =>
      await handleResponse(response: _apiService.foodTypes());

  @override
  Future<DataState<CreateDailyNutrientModel>> createDailyNutrient(
          CreateDailyNutrientBody body) async =>
      await handleResponse(response: _apiService.createDailyNutrient(body));

  @override
  Future<DataState<List<NutritionalInfoModel>>> nutritionalInfos(
          String id) async =>
      await handleResponse(response: _apiService.nutritionalInfos(id));
}
