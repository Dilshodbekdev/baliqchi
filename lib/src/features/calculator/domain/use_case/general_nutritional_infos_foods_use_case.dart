import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/food_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class GeneralNutritionalInfosFoodsUseCase
    implements UseCase<DataState<List<FoodModel>>, String> {
  final CalculatorRepository _repository;

  GeneralNutritionalInfosFoodsUseCase(this._repository);

  @override
  Future<DataState<List<FoodModel>>> call({required String params}) async =>
      await _repository.generalNutritionalInfosFoods(params);
}
