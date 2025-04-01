import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';

class UpdateGeneralCalculationUseCase
    implements
        UseCase<DataState<DefaultModel>,
            UpdateGeneralCalculation> {
  final CalculatorRepository _repository;

  UpdateGeneralCalculationUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required UpdateGeneralCalculation params}) async =>
      await _repository.updateGeneralCalculation(params);
}
