import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_fish_decline_body.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';

class CreateFishDeclineUseCase
    implements UseCase<DataState<DefaultModel>, CreateFishDeclineBody> {
  final CalculatorRepository _repository;

  CreateFishDeclineUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required CreateFishDeclineBody params}) async =>
      await _repository.createFishDecline(params);
}
