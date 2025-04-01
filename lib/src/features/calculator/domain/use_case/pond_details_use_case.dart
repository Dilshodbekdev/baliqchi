import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/pont_details_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class PondDetailsUseCase
    implements UseCase<DataState<PontDetailsModel>, String> {
  final CalculatorRepository _repository;

  PondDetailsUseCase(this._repository);

  @override
  Future<DataState<PontDetailsModel>> call({required String params}) async =>
      await _repository.pondDetails(params);
}
