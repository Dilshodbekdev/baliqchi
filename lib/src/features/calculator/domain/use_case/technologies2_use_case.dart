import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';

class Technologies2UseCase
    implements UseCase<DataState<List<TechnologyModel>>, int> {
  final EconomicRepository _repository;

  Technologies2UseCase(this._repository);

  @override
  Future<DataState<List<TechnologyModel>>> call({required int params}) async =>
      await _repository.technologies();
}
