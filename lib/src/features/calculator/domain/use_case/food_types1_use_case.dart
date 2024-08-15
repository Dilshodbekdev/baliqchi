import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';

class FoodTypes1UseCase implements UseCase<DataState<List<FishTypes>>, int> {
  final EconomicRepository _repository;

  FoodTypes1UseCase(this._repository);

  @override
  Future<DataState<List<FishTypes>>> call({required int params}) async =>
      await _repository.foodTypes();
}
