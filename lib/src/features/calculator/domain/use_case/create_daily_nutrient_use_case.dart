import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class CreateDailyNutrientUseCase
    implements
        UseCase<DataState<CreateDailyNutrientModel>, CreateDailyNutrientBody> {
  final CalculatorRepository _repository;

  CreateDailyNutrientUseCase(this._repository);

  @override
  Future<DataState<CreateDailyNutrientModel>> call(
          {required CreateDailyNutrientBody params}) async =>
      await _repository.createDailyNutrient(params);
}
