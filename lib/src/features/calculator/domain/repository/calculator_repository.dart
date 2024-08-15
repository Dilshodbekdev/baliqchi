import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';

abstract class CalculatorRepository {
  Future<DataState<List<FishTypes>>> fishTypes();

  Future<DataState<CreateDailyNutrientModel>> createDailyNutrient(
      CreateDailyNutrientBody body);

  Future<DataState<List<FishTypes>>> foodTypes();
  Future<DataState<List<NutritionalInfoModel>>> nutritionalInfos(String id);
}
