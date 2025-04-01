import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';

class DeleteFishDeclineUseCase
    implements UseCase<DataState<DefaultModel>, String> {
  final CalculatorRepository _repository;

  DeleteFishDeclineUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required String params}) async =>
      await _repository.deleteFishDecline(params);
}
