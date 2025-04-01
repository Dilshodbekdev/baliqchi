import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/bodies/filter_body.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_month_statistic_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';

class ExpenseMonthStatisticsUseCase
    implements
        UseCase<DataState<List<ExpenseMonthStatisticModel>>, FilterBody> {
  final EconomicRepository _repository;

  ExpenseMonthStatisticsUseCase(this._repository);

  @override
  Future<DataState<List<ExpenseMonthStatisticModel>>> call(
          {required FilterBody params}) async =>
      await _repository.expenseMonthStatistics(params);
}
