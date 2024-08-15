import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/data/models/region_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class RegionsUseCase implements UseCase<DataState<List<RegionModel>>, String> {
  final HomeRepository _repository;

  RegionsUseCase(this._repository);

  @override
  Future<DataState<List<RegionModel>>> call({required String params}) async =>
      await _repository.regions(null);
}
