import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class UpdateEconomicUseCase
    implements UseCase<DataState<DetailsEconomicModel>, PagingBody> {
  final EconomicRepository _repository;

  UpdateEconomicUseCase(this._repository);

  @override
  Future<DataState<DetailsEconomicModel>> call(
          {required PagingBody params}) async =>
      await _repository.updateEconomic(params);
}
