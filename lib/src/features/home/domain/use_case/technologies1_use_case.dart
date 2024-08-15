import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class Technologies1UseCase
    implements UseCase<DataState<List<TechnologyModel>>, int> {
  final HomeRepository _repository;

  Technologies1UseCase(this._repository);

  @override
  Future<DataState<List<TechnologyModel>>> call({required int params}) async =>
      await _repository.technologies();
}
