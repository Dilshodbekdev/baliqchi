import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/domain/repository/disease_repository.dart';

class DiseaseUseCase implements UseCase<DataState<DiseaseModel>, String> {
  final DiseaseRepository _repository;

  DiseaseUseCase(this._repository);

  @override
  Future<DataState<DiseaseModel>> call({required String params}) async =>
      await _repository.disease(params);
}
