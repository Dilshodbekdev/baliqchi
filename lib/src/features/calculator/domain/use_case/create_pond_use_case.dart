import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_pond_body.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';

class CreatePondUseCase
    implements UseCase<DataState<DefaultModel>, CreatePondBody> {
  final CalculatorRepository _repository;

  CreatePondUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required CreatePondBody params}) async =>
      await _repository.createPond(params);
}
