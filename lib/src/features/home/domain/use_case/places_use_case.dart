import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class PlacesUseCase implements UseCase<DataState<PlacesModel>, PagingBody> {
  final HomeRepository _repository;

  PlacesUseCase(this._repository);

  @override
  Future<DataState<PlacesModel>> call({required PagingBody params}) async =>
      await _repository.places(params);
}
