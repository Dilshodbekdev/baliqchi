import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class DefinitionsUseCase
    implements UseCase<DataState<List<DefinitionModel>>, int> {
  final HomeRepository _repository;

  DefinitionsUseCase(this._repository);

  @override
  Future<DataState<List<DefinitionModel>>> call(
          {required int params}) async =>
      await _repository.definitions();
}
