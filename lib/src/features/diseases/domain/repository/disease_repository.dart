import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

abstract class DiseaseRepository {
  Future<DataState<DiseasesModel>> diseases(PagingBody body);
}
