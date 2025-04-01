import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculation_details_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class GeneralCalculationDetailsUseCase
    implements UseCase<DataState<GeneralCalculationDetailsModel>, String> {
  final CalculatorRepository _repository;

  GeneralCalculationDetailsUseCase(this._repository);

  @override
  Future<DataState<GeneralCalculationDetailsModel>> call(
          {required String params}) async =>
      await _repository.generalCalculationDetails(params);
}
