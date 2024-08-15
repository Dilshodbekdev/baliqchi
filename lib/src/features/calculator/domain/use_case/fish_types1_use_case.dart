import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';

class FishTypes1UseCase implements UseCase<DataState<List<FishTypes>>, int> {
  final CalculatorRepository _repository;

  FishTypes1UseCase(this._repository);

  @override
  Future<DataState<List<FishTypes>>> call({required int params}) async =>
      await _repository.fishTypes();
}
