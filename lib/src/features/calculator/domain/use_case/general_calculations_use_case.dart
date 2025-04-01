import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculations_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class GeneralCalculationsUseCase
    implements UseCase<DataState<GeneralCalculationsModel>, PagingBody> {
  final CalculatorRepository _repository;

  GeneralCalculationsUseCase(this._repository);

  @override
  Future<DataState<GeneralCalculationsModel>> call(
          {required PagingBody params}) async =>
      await _repository.generalCalculations(params);
}
