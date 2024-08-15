import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/domain/repository/disease_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class DiseasesUseCase implements UseCase<DataState<DiseasesModel>, PagingBody> {
  final DiseaseRepository _repository;

  DiseasesUseCase(this._repository);

  @override
  Future<DataState<DiseasesModel>> call({required PagingBody params}) async =>
      await _repository.diseases(params);
}
