import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_fish_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class PondFishesUseCase
    implements UseCase<DataState<List<PondFishModel>>, int> {
  final CalculatorRepository _repository;

  PondFishesUseCase(this._repository);

  @override
  Future<DataState<List<PondFishModel>>> call({required int params}) async =>
      await _repository.pondFishes();
}
