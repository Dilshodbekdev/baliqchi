import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculations_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class GeneralCalculationListUseCase
    implements UseCase<DataState<List<GeneralCalculation>>, String> {
  final CalculatorRepository _repository;

  GeneralCalculationListUseCase(this._repository);

  @override
  Future<DataState<List<GeneralCalculation>>> call(
          {required String params}) async =>
      await _repository.generalCalculationList(params);
}
