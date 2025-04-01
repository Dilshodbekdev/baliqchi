import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_fish_decline_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_pond_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/fish_decline_statistic_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation.dart';
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
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';

abstract class CalculatorRepository {
  Future<DataState<List<FishTypes>>> fishTypes();

  Future<DataState<CreateDailyNutrientModel>> createDailyNutrient(
      CreateDailyNutrientBody body);

  Future<DataState<DefaultModel>> createPond(CreatePondBody body);

  Future<DataState<List<FishTypes>>> foodTypes();

  Future<DataState<List<TechnologyModel>>> technologies();

  Future<DataState<List<PondModel>>> ponds();

  Future<DataState<List<PondFishModel>>> pondFishes();

  Future<DataState<PontDetailsModel>> pondDetails(String id);

  Future<DataState<List<NutritionalInfoModel>>> nutritionalInfos(String id);

  Future<DataState<GeneralCalculationsModel>> generalCalculations(
      PagingBody body);

  Future<DataState<List<GeneralCalculation>>> generalCalculationList(String id);

  Future<DataState<GeneralCalculationDetailsModel>> generalCalculationDetails(
      String id);

  Future<DataState<DefaultModel>> updateGeneralCalculation(
      UpdateGeneralCalculation body);

  Future<DataState<DefaultModel>> deleteGeneralCalculation(String id);

  Future<DataState<DefaultModel>> createGeneralCalculation(
      CreateGeneralCalculationBody body);

  Future<DataState<List<FoodModel>>> generalNutritionalInfosFoods(String id);

  Future<DataState<List<GeneralNutritionalInfoModel>>> generalNutritionalInfos(
    PagingBody body,
  );

  Future<DataState<FishDeclinesModel>> fishDeclines(PagingBody body);

  Future<DataState<FishDeclineHistoryModel>> fishDeclinesHistory(
      PagingBody body);

  Future<DataState<FishDeclineDetailsModel>> fishDeclineDetails(String id);

  Future<DataState<DefaultModel>> deleteFishDecline(String id);

  Future<DataState<DefaultModel>> createFishDecline(CreateFishDeclineBody body);

  Future<DataState<FishDeclineStatisticModel>> fishDeclineStatistic(
      FishDeclineStatisticBody body);
}
