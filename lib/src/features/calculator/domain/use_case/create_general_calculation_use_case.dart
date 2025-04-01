import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';

class CreateGeneralCalculationUseCase
    implements UseCase<DataState<DefaultModel>, CreateGeneralCalculationBody> {
  final CalculatorRepository _repository;

  CreateGeneralCalculationUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required CreateGeneralCalculationBody params}) async =>
      await _repository.createGeneralCalculation(params);
}
