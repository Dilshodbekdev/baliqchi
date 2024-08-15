import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';

class DetailsEconomicUseCase
    implements UseCase<DataState<DetailsEconomicModel>, String> {
  final EconomicRepository _repository;

  DetailsEconomicUseCase(this._repository);

  @override
  Future<DataState<DetailsEconomicModel>> call(
          {required String params}) async =>
      await _repository.detailsEconomic(params);
}
