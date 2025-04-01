import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_history_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class FishDeclinesHistoryUseCase
    implements UseCase<DataState<FishDeclineHistoryModel>, PagingBody> {
  final CalculatorRepository _repository;

  FishDeclinesHistoryUseCase(this._repository);

  @override
  Future<DataState<FishDeclineHistoryModel>> call(
          {required PagingBody params}) async =>
      await _repository.fishDeclinesHistory(params);
}
