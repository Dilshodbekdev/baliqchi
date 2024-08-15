import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/bodies/create_economic_body.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';

class CreateEconomicUseCase
    implements UseCase<DataState<DefaultModel>, CreateEconomicBody> {
  final EconomicRepository _repository;

  CreateEconomicUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required CreateEconomicBody params}) async =>
      await _repository.createEconomic(params);
}
