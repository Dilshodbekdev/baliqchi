import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class PondsUseCase implements UseCase<DataState<List<PondModel>>, int> {
  final CalculatorRepository _repository;

  PondsUseCase(this._repository);

  @override
  Future<DataState<List<PondModel>>> call({required int params}) async =>
      await _repository.ponds();
}
