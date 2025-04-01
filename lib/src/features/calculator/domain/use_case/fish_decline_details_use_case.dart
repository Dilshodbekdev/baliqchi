import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_details_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class FishDeclineDetailsUseCase
    implements UseCase<DataState<FishDeclineDetailsModel>, String> {
  final CalculatorRepository _repository;

  FishDeclineDetailsUseCase(this._repository);

  @override
  Future<DataState<FishDeclineDetailsModel>> call(
          {required String params}) async =>
      await _repository.fishDeclineDetails(params);
}
