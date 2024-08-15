import 'package:baliqchi/src/core/resources/base_repository.dart';
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/diseases/data/data_source/diseases_api_service.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/domain/repository/disease_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class DiseasesRepositoryImpl with BaseRepository implements DiseaseRepository {
  final DiseasesApiService _apiService;

  DiseasesRepositoryImpl(this._apiService);

  @override
  Future<DataState<DiseasesModel>> diseases(PagingBody body) async =>
      await handleResponse(
          response: _apiService.diseases(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.search,
      ));
}
