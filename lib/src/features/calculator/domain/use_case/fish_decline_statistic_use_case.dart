import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/fish_decline_statistic_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_statistic_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class FishDeclineStatisticUseCase
    implements
        UseCase<DataState<FishDeclineStatisticModel>,
            FishDeclineStatisticBody> {
  final CalculatorRepository _repository;

  FishDeclineStatisticUseCase(this._repository);

  @override
  Future<DataState<FishDeclineStatisticModel>> call(
          {required FishDeclineStatisticBody params}) async =>
      await _repository.fishDeclineStatistic(params);
}
