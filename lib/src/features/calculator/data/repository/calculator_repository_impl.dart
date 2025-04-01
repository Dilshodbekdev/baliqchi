import 'package:baliqchi/src/core/resources/base_repository.dart';
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_fish_decline_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_pond_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/fish_decline_statistic_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation.dart';
import 'package:baliqchi/src/features/calculator/data/data_source/calculator_api_service.dart';
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
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';

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

  @override
  Future<DataState<DefaultModel>> createPond(CreatePondBody body) async {
    if (body.id != null) {
      return await handleResponse(
          response: _apiService.updatePond(body, body.id ?? ''));
    } else {
      return await handleResponse(response: _apiService.createPond(body));
    }
  }

  @override
  Future<DataState<List<PondModel>>> ponds() async =>
      await handleResponse(response: _apiService.ponds());

  @override
  Future<DataState<List<TechnologyModel>>> technologies() async =>
      await handleResponse(response: _apiService.technologies());

  @override
  Future<DataState<PontDetailsModel>> pondDetails(String id) async =>
      await handleResponse(response: _apiService.pontDetails(id));

  @override
  Future<DataState<DefaultModel>> createGeneralCalculation(
          CreateGeneralCalculationBody body) async =>
      await handleResponse(
          response: _apiService.createGeneralCalculation(body));

  @override
  Future<DataState<GeneralCalculationDetailsModel>> generalCalculationDetails(
          String id) async =>
      await handleResponse(response: _apiService.generalCalculationDetails(id));

  @override
  Future<DataState<GeneralCalculationsModel>> generalCalculations(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.generalCalculations(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.regionId,
      ));

  @override
  Future<DataState<FishDeclinesModel>> fishDeclines(PagingBody body) async =>
      await handleResponse(
          response: _apiService.fishDeclines(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.id,
        body.regionId,
      ));

  @override
  Future<DataState<FishDeclineDetailsModel>> fishDeclineDetails(
          String id) async =>
      await handleResponse(response: _apiService.fishDeclineDetails(id));

  @override
  Future<DataState<DefaultModel>> deleteFishDecline(String id) async =>
      await handleResponse(response: _apiService.deleteFishDecline(id));

  @override
  Future<DataState<FishDeclineHistoryModel>> fishDeclinesHistory(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.fishDeclinesHistory(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.id,
      ));

  @override
  Future<DataState<DefaultModel>> createFishDecline(
          CreateFishDeclineBody body) async =>
      await handleResponse(
          response: _apiService.createFishDecline(
        body.pondId,
        body.fishTypeId,
        body.fishAmount,
        body.weight,
        body.declineType,
        body.description,
        body.price,
        body.date,
      ));

  @override
  Future<DataState<FishDeclineStatisticModel>> fishDeclineStatistic(
          FishDeclineStatisticBody body) async =>
      await handleResponse(
          response:
              _apiService.fishDeclineStatistic(body.year, body.fishTypeId));

  @override
  Future<DataState<List<PondFishModel>>> pondFishes() async =>
      await handleResponse(response: _apiService.pondFishes());

  @override
  Future<DataState<List<GeneralCalculation>>> generalCalculationList(
          String id) async =>
      await handleResponse(response: _apiService.generalCalculationList(id));

  @override
  Future<DataState<List<GeneralNutritionalInfoModel>>> generalNutritionalInfos(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.generalNutritionalInfos(
        body.id ?? '',
        body.regionId ?? '',
      ));

  @override
  Future<DataState<List<FoodModel>>> generalNutritionalInfosFoods(
          String id) async =>
      await handleResponse(
          response: _apiService.generalNutritionalInfosFoods(id));

  @override
  Future<DataState<DefaultModel>> updateGeneralCalculation(
          UpdateGeneralCalculation body) async =>
      await handleResponse(
          response: _apiService.updateGeneralCalculation(body.id, body.body));

  @override
  Future<DataState<DefaultModel>> deleteGeneralCalculation(String id) async =>
      await handleResponse(response: _apiService.deleteGeneralCalculation(id));
}
